// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/cupertino.dart';

class CalculatorController extends ChangeNotifier {
  List<String> listNumbers = [];
  List<String> listOperators = [];
  final List<int?> _listaTotal = [];
  String? selectedOperator;
  int? selectedNumber = 0;
  double total = 0;

  addOperator(String op) {
    listOperators.add(op);
    _listaTotal.add(selectedNumber);
    listNumbers.clear();
    selectedNumber = 0;
    notifyListeners();
  }

  addNumber(String number) {
    listNumbers.add(number);

    String numbersAgrouped = listNumbers.join('');

    selectedNumber = int.parse(numbersAgrouped);
    notifyListeners();
  }

  double doSum() {
    if (listOperators.length > 1) {
      double? newNumber = double.parse(listNumbers.join(''));

      total += newNumber;
      _listaTotal.add(total.toInt());
      return total;
    } else {
      double sum = 0;
      double oldOp = double.parse(_listaTotal.join(''));

      sum = selectedNumber! + oldOp;
      total = sum;
      _listaTotal.add(total.toInt());

      return total;
    }
    // return total;
  }

  verifyOperator(String op) {
    switch (op) {
      case '+':
        // total = null;
        doSum();
        selectedNumber = null;
        // print('its sum');
        break;
      default:
    }
  }

  getResult() async {
    if (listNumbers.isNotEmpty && listOperators.isNotEmpty) {
      for (var op in listOperators) {
        await verifyOperator(op);
        notifyListeners();
      }
    }
  }
}
