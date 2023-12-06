import 'package:flutter/material.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String _input = '';
  String _output = '';
  double _num1 = 0;
  double _num2 = 0;
  String _operand = '';
  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _input = '';
        _output = '';
        _num1 = 0;
        _num2 = 0;
        _operand = '';
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '*' ||
          buttonText == '/') {
        _num1 = double.parse(_input);
        _operand = buttonText;
        _output = '';
        _input = '';
      } else if (buttonText == '=') {
        _num2 = double.parse(_input);
        if (_operand == '+') {
          _output = (_num1 + _num2).toString();
        }
        if (_operand == '-') {
          _output = (_num1 - _num2).toString();
        }
        if (_operand == '*') {
          _output = (_num1 * _num2).toString();
        }
        if (_operand == '/') {
          _output = (_num1 / _num2).toString();
        }
      } else {
        _input += buttonText;
      }
    });
  }

  Widget _buildButton(
    String buttonText,
    Color buttonColor,
    Color textColor,
  ) {
    return Expanded(
      child: Container(
        width: 80.0,
        height: 114.0,
        margin: EdgeInsets.all(6.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: buttonColor,
            onPrimary: textColor,
          ),
          onPressed: () {
            _buttonPressed(buttonText);
          },
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 36.0),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonRow(List<String> buttons) {
    return Row(
      children: buttons
          .map((button) => _buildButton(
                button,
                button == 'C' ? Colors.black! : Colors.grey[900]!,
                button == '=' ||
                        button == '/' ||
                        button == '*' ||
                        button == '-' ||
                        button == '+'
                    ? Colors.amber
                    : Colors.white,
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey[900], // Customize the background color
        centerTitle: true, // Center the title
        elevation: 0,
      ),
      body: Column(
        children: [
          // Expanded(
          // child:
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text('$_num1',
                    style:
                        TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold)),

                // Display operand
                Text('$_operand',
                    style:
                        TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold)),

                Text('$_num2',
                    style:
                        TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold)),
                Text('=',
                    style:
                        TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold)),

                Text('$_output',
                    style:
                        TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          // ),
          Divider(height: 5.0),
          Column(
            children: [
              _buildButtonRow(['7', '8', '9', '/']),
              _buildButtonRow(['4', '5', '6', '*']),
              _buildButtonRow(['1', '2', '3', '-']),
              _buildButtonRow(['C', '0', '=', '+']),
            ],
          ),
        ],
      ),
    );
  }
}
