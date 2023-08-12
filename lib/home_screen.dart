import 'package:calculator_web_app/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> buttonTexts = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '-',
    '00',
    '0',
    '.',
    '=',
  ];

  String questionText = '';
  String answerText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.yellow,
              Colors.orange,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Container(
            width: 400,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        children: [
                          Text(
                            questionText,
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                          ),
                          Text(
                            answerText,
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.end,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  flex: 4,
                  child: GridView.builder(
                    itemCount: buttonTexts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        _buttonTap(buttonTexts[index]);
                      },
                      child: ButtonWidget(
                        text: buttonTexts[index],
                      ),
                    ),
                    physics: NeverScrollableScrollPhysics(),
                  ),
                ),
              ],
            ),
            margin: EdgeInsets.symmetric(vertical: 50),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }

  void _buttonTap(String textButton) {
    if (textButton == 'C') {
      if (questionText != '') {
        setState(() {
          questionText = questionText.substring(0, questionText.length - 1);
        });
      }
    } else if (textButton == 'DEL') {
      setState(() {
        questionText = '';
        answerText = '';
      });
    } else if (textButton == '=') {
      if (questionText != '') {
        _calculate(questionText);
      }
    } else {
      setState(() {
        questionText += textButton;
      });
    }
  }

  void _calculate(String text) {
    String replacedtext = text.replaceAll('x', '*');
    Parser p = Parser();

    Expression exp = p.parse(replacedtext);

    ContextModel cm = ContextModel();

    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      answerText = eval.toStringAsFixed(2);
    });
  }
}
