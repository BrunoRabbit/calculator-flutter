import 'package:calculator/controllers/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<CalculatorController>(context);
    const defaultPadding = 12.0;
    const style = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1F1F1F),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => _controller.deleteHistory(),
            child: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.delete_forever,
              ),
            ),
          ),
        ],
      ),
      body: _controller.model.isEmpty
          ? const Padding(
              padding: EdgeInsets.all(defaultPadding / 1.5),
              child: Center(
                child: Text(
                  'Ainda não há histórico',
                  style: style,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(top: defaultPadding / 3),
              child: ListView.builder(
                itemCount: _controller.model.length,
                itemBuilder: (context, index) {
                  final model = _controller.model[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: defaultPadding / 3,
                      horizontal: defaultPadding / 1.5,
                    ),
                    child: Container(
                      height: 80,
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(defaultPadding),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding),
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
                            Text(
                              model.history,
                              textAlign: TextAlign.end,
                              style: style,
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
