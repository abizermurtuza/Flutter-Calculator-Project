import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class InputController extends GetxController {
  var firstInput = ''.obs;
  var secondInput = ''.obs;
  var totalInput = ''.obs;
  var answer = ''.obs;
  var currentInput = ''.obs;
  var operator = ''.obs;

  onEqualPressed() {
    var expression = totalInput.value;
    expression = expression.replaceAll("x", "*");
    expression = expression.replaceAll("÷", "/");
    Parser parser = Parser();
    Expression exp = parser.parse(expression);
    ContextModel context = ContextModel();
    double evaluation = exp.evaluate(EvaluationType.REAL, context);

    answer = RxString(evaluation.toString());
    update();
  }

  void updateTotalInput() {
    totalInput.value =
        '${firstInput.value} ${operator.value} ${secondInput.value}';
  }

  onBtnTapped(List<String> buttons, int index) {
    String onPressButton = buttons[index];

    if (onPressButton == '+' ||
        onPressButton == '-' ||
        onPressButton == 'x' ||
        onPressButton == '÷') {
      operator.value = onPressButton;
      operator.replaceAll('x', '*');
      currentInput.value = '';
    } else {
      if (operator.value.isEmpty) {
        if (firstInput.value.length < 16) {
          firstInput.value += onPressButton;
          currentInput.value = firstInput.value;
          updateTotalInput();
        }
      } else {
        if (secondInput.value.length < 16) {
          secondInput.value += onPressButton;
          currentInput.value = secondInput.value;
          updateTotalInput();
        }
      }
    }
    if (answer.isNotEmpty) {
      if (onPressButton == '+' ||
          onPressButton == '-' ||
          onPressButton == 'x' ||
          onPressButton == '÷') {
        firstInput.value = answer.value;
        secondInput.value = '';
        totalInput.value = '';
        answer.value = '';
        currentInput.value = firstInput.value;
        updateTotalInput();
      } else {
        clearInputOutput();
      }
    }

    update();
  }

  clearInputOutput() {
    firstInput.value = '';
    secondInput.value = '';
    totalInput.value = '';
    answer.value = '';
    currentInput.value = '';
    update();
  }

  deleteBtn() {
    if (currentInput.value.isNotEmpty) {
      currentInput.value =
          currentInput.value.substring(0, currentInput.value.length - 1);
      if (firstInput.value.isNotEmpty) {
        firstInput.value = currentInput.value;
      } else {
        secondInput.value = currentInput.value;
      }
    } else if (secondInput.value.isNotEmpty) {
      secondInput.value =
          secondInput.value.substring(0, secondInput.value.length - 1);
    } else if (firstInput.value.isNotEmpty) {
      firstInput.value =
          firstInput.value.substring(0, firstInput.value.length - 1);
    }
    update();
  }

  signChange() {
    if (firstInput.value.isNotEmpty) {
      if (firstInput.value.startsWith('-')) {
        firstInput.value = firstInput.value.replaceFirst('-', '');
      } else {
        firstInput.value = '-${firstInput.value}';
      }
    } else if (secondInput.value.isNotEmpty) {
      if (secondInput.value.startsWith('-')) {
        secondInput.value = secondInput.value.replaceFirst('-', '');
      } else {
        secondInput.value = '-${secondInput.value}';
      }
    }
    update();
  }

  percentSign() {
    if (firstInput.value.isNotEmpty) {
      double firstInputValue = double.parse(firstInput.value);
      firstInput.value = (firstInputValue / 100).toString();
    } else if (secondInput.value.isNotEmpty) {
      double secondInputValue = double.parse(secondInput.value);
      secondInput.value = (secondInputValue / 100).toString();
    }
    update();
  }
}
