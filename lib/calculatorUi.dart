import 'package:flutter/material.dart';

class CalculatorUI extends StatefulWidget {
  @override
  _CalculatorUIState createState() => _CalculatorUIState();
}

class _CalculatorUIState extends State<CalculatorUI> {

  String output="0";

  String _tempOutput="";
  double num1=0.0;
  double num2=0.0;
  String operand="";
  String op="";
  RegExp regExp=new RegExp("[+|/|x|\-]");

  var temp;

  buttonPressed(String btnVal){
    if(btnVal=="+"||btnVal=="-"||btnVal=="/"||btnVal=="x") {
      setState(() {
        op = regExp.stringMatch(_tempOutput);
        operand = btnVal;
        if (_tempOutput != "0") {
          num1 = double.parse(_tempOutput);
          print(num1);
          _tempOutput = _tempOutput + operand;
          output = _tempOutput;
          if (regExp.hasMatch(_tempOutput)) {
            _tempOutput = "";
          }
        }
      });
    }else if(btnVal=="="){
      
    }else if(operand.isNotEmpty){
      setState(() {
        if(_tempOutput!="0") {

          num2 = num2 * 10 + double.parse(btnVal);
          _tempOutput = output + btnVal;
          output=output+btnVal;
        }
        print(num2);
      });
    }else if(btnVal=="(-)"){

    }else if(btnVal=="."){

    }else if(operand.isEmpty){
      setState(() {
        if(_tempOutput!="0"){
          _tempOutput=_tempOutput+btnVal;
          output=_tempOutput;
        }
      });
    }
  }

  Widget buildButton(String value){
    return Expanded(
      child: FlatButton(
        padding: EdgeInsets.all(24),
        child: Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600]
          ),
        ),
        onPressed: (){
          buttonPressed(value);
        }
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Calculator'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(vertical: 24,horizontal: 12),
                child: Text(
                    output,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                  ),
                )
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("+")
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("-")
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("x")
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("."),
                    buildButton("0"),
                    buildButton("( )"),
                    buildButton("/")
                  ],
                ),

                Row(
                  children: <Widget>[
                    buildButton("="),
                    Expanded(
                      child: FlatButton(
                        padding: EdgeInsets.all(24),
                        child: Text(
                            "C",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600]
                            ),
                        ),
                        onPressed: (){
                            setState(() {
                              _tempOutput="";
                              num1=0.0;
                              num2=0.0;
                              operand="";
                              output="0";
                            });
                        },
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                      padding: EdgeInsets.all(24),
                      child: Icon(
                          Icons.backspace,
                        color: Colors.grey[600],
                      ),
                        onPressed: (){
                        setState(() {
                          output=output.substring(0,output.length-1);
                          print(output);
                        });
                        },
                        ),
                      )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
