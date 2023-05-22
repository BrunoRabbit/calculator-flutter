import 'package:calculator/models/calculate_data.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class CalculatorController extends ChangeNotifier {
  String display = '0';
  double total = 0;
  String? _operator;

  List<CalculateData> model = <CalculateData>[];

  void addNumber(String text) {
    if (text != '.' && display == '0') {
      display = text;
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
    notifyListeners();
  }

  void resetInputs() {
    display = '0';
    total = 0;
    _operator = null;
    notifyListeners();
  }

  void deleteHistory() {
    model.clear();
    notifyListeners();
  }

  // Decimal Function(String value) get decimalValue => (String value) {
  //       return Decimal.parse(value);
  //     };

  void calculateResult() {
    double currentNum = double.parse(display);
    double previousNum = total;
    double? newTotal;

    newTotal = _performOperation(previousNum, currentNum);

    if (newTotal != null) {
      total = newTotal;
      display = total.toString();
      total = 0;

      _getTimeNow(previousNum, currentNum);
    }

    notifyListeners();
  }

  void _getTimeNow(double previousNum, double currentNum) {
    DateTime dateNow = DateTime.now();
    DateFormat format = DateFormat('EEEE', 'pt-BR');

    String day = format.format(dateNow);
    String hour = DateFormat('h:mm a').format(dateNow);

    String history = '$previousNum $_operator $currentNum =\n $display';

    if (_isDateToday(dateNow)) {
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

  bool _isDateToday(DateTime dateNow) {
    DateTime today = DateTime.now().toLocal();

    final bool isYearEqual = dateNow.year == today.year;
    final bool isMonthEqual = dateNow.month == today.month;
    final bool isDayEqual = dateNow.day == today.day;

    if (isYearEqual && isMonthEqual && isDayEqual) {
      return true;
    }
    return false;
  }

  double? _performOperation(double previousNum, double currentNum) {
    Decimal value;

    switch (_operator) {
      case '+':
        return previousNum + currentNum;
      case '-':
        value = _decimalValue('$previousNum') - _decimalValue('$currentNum');
        return value.toDouble();
      case 'x':
        return previousNum * currentNum;
      case '/':
        return previousNum / currentNum;
      case '%':
        return (previousNum / 100) * currentNum;
      default:
        return null;
    }
  }

  Decimal _decimalValue(String value) {
    return Decimal.parse(value);
  }
}
