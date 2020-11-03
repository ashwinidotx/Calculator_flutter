import 'package:math_expressions/math_expressions.dart';

String calculateAnswer(var userQuestion) {
  String expression = userQuestion;
  expression = expression.replaceAll('x', '*'); // * is to multiply.

  Parser p = Parser();
  Expression exp = p.parse(expression);
  try {
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    return eval.toString();
  } catch (e) {
    print(e);
  }

  return '0';
}
