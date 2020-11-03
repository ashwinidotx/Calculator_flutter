import 'package:flutter/material.dart';
import 'mybutton.dart';
import 'constants.dart';
import 'buttonlist.dart';
import 'checknumber.dart';
import 'calculateanswer.dart';
import 'isoperator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = '';
  var userAnswer = '0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8.0),
                child: Container(
                  decoration: kButtonDecoration.copyWith(
                    boxShadow: kBoxShadow,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            userQuestion.toString(),
                            style: kConsoleTextStyle,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            userAnswer.toString(),
                            style: kConsoleTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
                child: Container(
                  decoration: kButtonDecoration.copyWith(
                    color: Color(0xfff5f5f5),
                  ),
                  child: GridView.builder(
                      itemCount: buttons.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          return MyButton(
                            onTap: () {
                              setState(() {
                                userQuestion = '';
                                userAnswer = '0';
                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.red,
                            textColor: Colors.white,
                          );
                        } else if (index == 1) {
                          return MyButton(
                            onTap: () {
                              setState(() {
                                if (userQuestion.length > 1)
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                else
                                  userQuestion = '';
                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.redAccent,
                            textColor: Colors.white,
                          );
                        } else if (buttons[index] == 'ANS' ||
                            buttons[index] == '=') {
                          return MyButton(
                            onTap: () {
                              setState(() {
                                if (buttons[index] == 'ANS') {
                                  userAnswer = calculateAnswer(userQuestion);
                                  userQuestion = '';
                                } else {
                                  userAnswer = calculateAnswer(userQuestion);
                                }
                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.green,
                            textColor: Colors.white,
                          );
                        } else {
                          return MyButton(
                            onTap: () {
                              setState(() {
//                                if (!isOperator(buttons[index]) &&
//                                    !isOperator(
//                                        userQuestion[userQuestion.length - 1]))
                                userQuestion += buttons[index];
                              });
                            },
                            buttonText: buttons[index],
                            color: isNumber(buttons[index])
                                ? Color(0xffe0dede)
                                : Color(0xff6a197d),
                            textColor: isNumber(buttons[index])
                                ? Color(0xff6a197d)
                                : Colors.white,
                          );
                        }
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
