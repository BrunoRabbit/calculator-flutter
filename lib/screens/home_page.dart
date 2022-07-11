import 'package:calculator/controllers/calculator_controller.dart';
import 'package:calculator/widgets/buttons_area.dart';
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
            SizedBox(
              height: 180,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _controller.selectedNumber?.toString() ??
                        _controller.total.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
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
