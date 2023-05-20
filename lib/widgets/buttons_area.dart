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
                    print('%');
                  },
                ),
                CalculatorButton(
                  color: const Color(0xff141414),
                  title: '/',
                  onTap: () {
                    print('/');
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
                    // _controller.addNumber('8');
                  },
                ),
                CalculatorButton(
                  title: '9',
                  onTap: () {
                    print('AC');
                  },
                ),
                CalculatorButton(
                  title: 'x',
                  onTap: () {
                    print('AC');
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
                    print('AC');
                  },
                ),
                CalculatorButton(
                  title: '5',
                  onTap: () {
                    print('AC');
                  },
                ),
                CalculatorButton(
                  title: '6',
                  onTap: () {
                    print('AC');
                  },
                ),
                CalculatorButton(
                  title: '-',
                  onTap: () {
                    print('AC');
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
                    print('AC');
                  },
                ),
                CalculatorButton(
                  title: '2',
                  onTap: () {
                    print('AC');
                  },
                ),
                CalculatorButton(
                  title: '3',
                  onTap: () {
                    print('AC');
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
                    //  _controller.getResult();
                    },
                  ),
                ),
                CalculatorButton(
                  title: ',',
                  onTap: () {
                    print('AC');
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
