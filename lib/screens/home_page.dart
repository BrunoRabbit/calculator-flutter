import 'package:calculator/controllers/calculator_controller.dart';
import 'package:calculator/screens/history_page.dart';
import 'package:calculator/widgets/buttons_area.dart';
import 'package:calculator/widgets/toggle_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<CalculatorController>(context);
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: theme.background,
      body: SafeArea(
        child: Column(
          children: [
            // ? app bar
            SizedBox(
              height: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //? cupertino toggle btn
                  const ToggleButtonWidget(),

                  //? history icon
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HistoryPage(),
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16.0, right: 4),
                          child: Icon(
                            Icons.history,
                            color: theme.tertiary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ? display
            SizedBox(
              height: 90,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Text(
                      _controller.display,
                      style: TextStyle(
                        color: _contrastColors(theme),
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const ButtonsArea()
          ],
        ),
      ),
    );
  }

  Color _contrastColors(ColorScheme theme) {
    if (theme.brightness == Brightness.light) {
      return Colors.black;
    }
    return Colors.white;
  }
}
