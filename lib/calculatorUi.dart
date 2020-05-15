import 'package:flutter/material.dart';

class CalculatorUI extends StatefulWidget {
  @override
  _CalculatorUIState createState() => _CalculatorUIState();
}

class _CalculatorUIState extends State<CalculatorUI> {

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
        onPressed: (){}
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
                    "0",
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
                    buildButton("(-)"),
                    buildButton("/")
                  ],
                ),

                Row(
                  children: <Widget>[
                    buildButton("="),
                    Expanded(
                      child: FlatButton(
                      padding: EdgeInsets.all(24),
                      child: IconButton(icon: Icon(Icons.backspace),),
                        onPressed: (){},
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
