import 'package:calculator/components/calculator_button.dart';
import 'package:calculator/controllers/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonsArea extends StatefulWidget {
  const ButtonsArea({Key? key}) : super(key: key);

  @override
  State<ButtonsArea> createState() => _ButtonsAreaState();
}

class _ButtonsAreaState extends State<ButtonsArea> {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<CalculatorController>(context);
    return Flexible(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              children: [
                Expanded(
                  child: CalculatorButton(
                    color: const Color(0xff141414),
                    title: 'AC',
                    onTap: () {
                      _controller.resetInputs();
                    },
                  ),
                ),
                CalculatorButton(
                  color: const Color(0xff141414),
                  title: '%',
                  onTap: () {
                    _controller.addOperator('%');
                  },
                ),
                CalculatorButton(
                  color: const Color(0xff141414),
                  title: '/',
                  onTap: () {
                    _controller.addOperator('/');
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              children: [
                CalculatorButton(
                  title: '7',
                  onTap: () {
                    _controller.addNumber("7");
                  },
                ),
                CalculatorButton(
                  title: '8',
                  onTap: () {
                    _controller.addNumber('8');
                  },
                ),
                CalculatorButton(
                  title: '9',
                  onTap: () {
                    _controller.addNumber('9');
                  },
                ),
                CalculatorButton(
                  title: 'x',
                  onTap: () {
                    _controller.addOperator('x');
                  },
                  color: const Color(0xff141414),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              children: [
                CalculatorButton(
                  title: '4',
                  onTap: () {
                    _controller.addNumber('4');
                  },
                ),
                CalculatorButton(
                  title: '5',
                  onTap: () {
                    _controller.addNumber('5');
                  },
                ),
                CalculatorButton(
                  title: '6',
                  onTap: () {
                    _controller.addNumber('6');
                  },
                ),
                CalculatorButton(
                  title: '-',
                  onTap: () {
                    _controller.addOperator('-');
                  },
                  color: const Color(0xff141414),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              children: [
                CalculatorButton(
                  title: '1',
                  onTap: () {
                    _controller.addNumber('1');
                  },
                ),
                CalculatorButton(
                  title: '2',
                  onTap: () {
                    _controller.addNumber('2');
                  },
                ),
                CalculatorButton(
                  title: '3',
                  onTap: () {
                    _controller.addNumber('3');
                  },
                ),
                CalculatorButton(
                  title: '+',
                  onTap: () {
                    _controller.addOperator('+');
                  },
                  color: const Color(0xff141414),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              children: [
                Expanded(
                  child: CalculatorButton(
                    title: '0',
                    onTap: () {
                      _controller.addNumber('0');
                    },
                  ),
                ),
                CalculatorButton(
                  title: ',',
                  onTap: () {
                    _controller.addNumber('.');
                  },
                ),
                CalculatorButton(
                  title: '=',
                  onTap: () {
                    _controller.calculateResult();
                  },
                  color: const Color(0xff0370C4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
