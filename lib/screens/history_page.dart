import 'package:calculator/controllers/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<CalculatorController>(context);
    final theme = Theme.of(context).colorScheme;

    const kDefaultPadding = 12.0;
    final style = TextStyle(
      fontSize: 16,
      color: theme.tertiary,
      fontWeight: FontWeight.w500,
    );

    return Scaffold(
      backgroundColor: theme.background,
      appBar: AppBar(
        backgroundColor: theme.secondary,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: theme.tertiary,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => _controller.deleteHistory(),
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.delete_forever,
                color: theme.tertiary,
              ),
            ),
          ),
        ],
      ),
      body: _controller.model.isEmpty
          ? Padding(
              padding: const EdgeInsets.all(kDefaultPadding / 1.5),
              child: Center(
                child: Text(
                  'Ainda não há histórico',
                  style: style,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(top: kDefaultPadding / 3),
              child: ListView.builder(
                itemCount: _controller.model.length,
                itemBuilder: (context, index) {
                  final model = _controller.model[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: kDefaultPadding / 3,
                      horizontal: kDefaultPadding / 1.5,
                    ),
                    child: Container(
                      height: 80,
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        color: theme.brightness == Brightness.dark
                            ? theme.secondary.withOpacity(0.4)
                            : Colors.black12,
                        borderRadius: BorderRadius.circular(kDefaultPadding),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(kDefaultPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(model.day, style: style),
                                Text(model.hour),
                              ],
                            ),
                            Flexible(
                              child: Text(
                                model.history,
                                textAlign: TextAlign.end,
                                style: style,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
