import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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
  Widget calculatorbtn (String btntext, Color btncolor, Color textcolor) {
    return Container(
      child: ElevatedButton (
        onPressed: () {
          // TODO Add function for button
        },
        style: ButtonStyle (
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: const BorderSide(color: Colors.white),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(btncolor),
          padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
        ),
        child: Text (
          btntext,
          style: TextStyle(fontSize: 35, color: textcolor,),
        )
      )
        
    );
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
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Calculator display
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    '0',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 100),
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
            const SizedBox(height: 10,),
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
            const SizedBox(height: 10,),
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
            const SizedBox(height: 10,),
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
          ],
        ),
      ),
    );
  }
}
