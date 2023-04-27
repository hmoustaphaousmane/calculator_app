import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget calculatorbtn(String btntext, Color btncolor, Color textcolor) {
    return Container(
        child: ElevatedButton(
            onPressed: () {
              calculation(btntext);
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(color: Colors.white),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(btncolor),
              padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
            ),
            child: Text(
              btntext,
              style: TextStyle(
                fontSize: 35,
                color: textcolor,
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Calculator display
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.white, fontSize: 100),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Call buttons function : calculatorbtn
                calculatorbtn('AC', Colors.grey, Colors.black),
                calculatorbtn('+/-', Colors.grey, Colors.black),
                calculatorbtn('%', Colors.grey, Colors.black),
                calculatorbtn('/', Colors.amber[700]!, Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Call buttons function : calculatorbtn
                calculatorbtn('7', Colors.grey[850]!, Colors.black),
                calculatorbtn('8', Colors.grey[850]!, Colors.black),
                calculatorbtn('9', Colors.grey[850]!, Colors.black),
                calculatorbtn('x', Colors.amber[700]!, Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Call buttons function : calculatorbtn
                calculatorbtn('4', Colors.grey[850]!, Colors.black),
                calculatorbtn('5', Colors.grey[850]!, Colors.black),
                calculatorbtn('6', Colors.grey[850]!, Colors.black),
                calculatorbtn('-', Colors.amber[700]!, Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Call buttons function : calculatorbtn
                calculatorbtn('1', Colors.grey[850]!, Colors.black),
                calculatorbtn('2', Colors.grey[850]!, Colors.black),
                calculatorbtn('3', Colors.grey[850]!, Colors.black),
                calculatorbtn('+', Colors.amber[700]!, Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 0 button :
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.fromLTRB(34, 20, 128, 20)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: const BorderSide(color: Colors.white),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey[850]),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "0",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
                calculatorbtn('.', Colors.grey[850]!, Colors.black),
                calculatorbtn('=', Colors.amber[700]!, Colors.white),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Calculator logic
  dynamic text = '0';
  double firstNumber = 0;
  double secondNumber = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic operator = '';
  dynamic preOperator = '';
  void calculation(btntext) {
    if (btntext == 'AC') {
      text = '0';
      firstNumber = 0;
      secondNumber = 0;
      result = '';
      finalResult = '0';
      operator = '';
      preOperator = '';
    } else if (operator == '=' && btntext == '=') {
      if (preOperator == '+') {
        finalResult = add();
      } else if (preOperator == '-') {
        finalResult = sub();
      } else if (preOperator == 'x') {
        finalResult = mul();
      } else if (preOperator == '/') {
        finalResult = div();
      }
    } else if (btntext == '+' ||
        btntext == '-' ||
        btntext == 'x' ||
        btntext == '/' ||
        btntext == '=') {
      if (firstNumber == 0) {
        firstNumber = double.parse(result);
      } else {
        secondNumber = double.parse(result);
      }

      if (operator == '+') {
        finalResult = add();
      } else if (operator == '-') {
        finalResult = sub();
      } else if (operator == 'x') {
        finalResult = mul();
      } else if (operator == '/') {
        finalResult = div();
      }
      preOperator = operator;
      operator = btntext;
      result = '';
    } else if (btntext == '%') {
      result = firstNumber / 100;
      finalResult = doesContainDecimal(result);
    } else if (btntext == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btntext == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btntext;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (firstNumber + secondNumber).toString();
    firstNumber = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (firstNumber - secondNumber).toString();
    firstNumber = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (firstNumber * secondNumber).toString();
    firstNumber = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (firstNumber / secondNumber).toString();
    firstNumber = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0)) {
        return result = splitDecimal[0].toString();
      }
    }
    return result;
  }
}
