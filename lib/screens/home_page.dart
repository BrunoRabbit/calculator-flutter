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
    return Scaffold(
      backgroundColor: const Color(0xff1F1F1F),
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
                        child: const Padding(
                          padding: EdgeInsets.only(top: 16.0, right: 4),
                          child: Icon(
                            Icons.history,
                            color: Colors.white,
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
                      style: const TextStyle(
                        color: Colors.white,
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
}
