import 'package:calculator/models/calculate_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class CalculatorController extends ChangeNotifier {
  String display = '0';
  double total = 0;
  String? _operator;
  bool _isOperatorClicked = false;

  List<CalculateData> model = <CalculateData>[];

  void addNumber(String text) {
    if (display == '0' || _isOperatorClicked) {
      display = text;
      _isOperatorClicked = false;
    } else {
      display += text;
    }
    notifyListeners();
  }

  void addOperator(String operator) {
    if (_operator != null) {
      calculateResult();
    }
    total = double.parse(display);
    display = '0';
    _operator = operator;
    _isOperatorClicked = true;
    notifyListeners();
  }

  void resetInputs() {
    display = '0';
    total = 0;
    _operator = null;
    _isOperatorClicked = false;
    model.clear();
    notifyListeners();
  }

  void calculateResult() {
    double currentNum = double.parse(display);
    double previousNum = total;
    double? newTotal;

    if (_operator == '+') {
      newTotal = previousNum + currentNum;
    } else if (_operator == '-') {
      newTotal = previousNum - currentNum;
    } else if (_operator == 'x') {
      newTotal = previousNum * currentNum;
    } else if (_operator == '/') {
      newTotal = previousNum / currentNum;
    }

    total = newTotal!;
    display = total.toString();

    getTimeNow(previousNum, currentNum);
    notifyListeners();
  }

  void getTimeNow(double previousNum, double currentNum) {
    DateTime dateNow = DateTime.now();
    DateTime today = DateTime.now().toLocal();

    DateFormat format = DateFormat('EEEE', 'pt-BR');

    String day = format.format(dateNow);
    String hour = DateFormat('h:mm a').format(dateNow);

    String history = '$previousNum $_operator $currentNum =\n $display';

    if (dateNow.year == today.year &&
        dateNow.month == today.month &&
        dateNow.day == today.day) {
      day = 'hoje';
    }

    model.add(
      CalculateData(
        history: history,
        day: day[0].toUpperCase() + day.substring(1, day.length),
        hour: hour,
      ),
    );
  }
}
