
import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BmiLogic();
  }
}

class BmiLogic extends State<BMI> {
  final TextEditingController _age = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _height = TextEditingController();
  double result = 0.0;
    String _resultReading = "";

  finalresult() {
    setState(() {
      result = calculateBmi();
      if (double.parse(result.toStringAsFixed(1)) < 18.5) {
             _resultReading = "Underweight";
             print(_resultReading);

           }else if (double.parse(result.toStringAsFixed(1)) >= 18.5
             && result < 25) {
               _resultReading = "Great Shape!"; // Normal
               print(_resultReading);
           }else if (double.parse(result.toStringAsFixed(1)) >= 25.0
            && result < 30) {
              _resultReading = "Overweight";
           }else if (double.parse(result.toStringAsFixed(1)) >= 30.0) {
              _resultReading = "Obese";
           }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(
          "BMI",
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 40,
              fontWeight: FontWeight.w900,
              color: Colors.white70),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
          alignment: Alignment.center,
          child: ListView(
            padding: EdgeInsets.all(2.0),
            children: <Widget>[
              new Image.asset(
                'images/111 bmilogo.png',
                height: 150,
                width: 200,
              ),
              new Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  color: Colors.black12,
                  height: 250,
                  child: new Column(
                    children: <Widget>[
                      new TextField(
                        controller: _age,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Age",
                            hintText: "eg: 26",
                            hintStyle: TextStyle(color: Colors.black38),
                            icon: Icon(Icons.person_outline,
                                color: Colors.black)),
                      ),
                      new Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                      new TextField(
                        keyboardType: TextInputType.number,
                        controller: _height,
                        decoration: InputDecoration(
                            labelText: "Height in cm",
                            hintText: "eg: 165",
                            hintStyle: TextStyle(color: Colors.black38),
                            icon: Icon(Icons.poll, color: Colors.black)),
                      ),
                      new Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                      new TextField(
                        keyboardType: TextInputType.number,
                        controller: _weight,
                        decoration: InputDecoration(
                            labelText: "Weight in Kg",
                            hintText: "eg: 62.5",
                            hintStyle: TextStyle(color: Colors.black38),
                            icon: Icon(Icons.line_weight, color: Colors.black)),
                      ),
                    ],
                  )),
              new Column(
                children: <Widget>[
                  new Padding(padding: EdgeInsets.all(15.0)),
                  new FlatButton(
                    color: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0)),
                    onPressed: finalresult,
                    padding: EdgeInsets.all(10.0),
                    child: new Text(
                      "   Calculate   ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  new Text(
                    "BMI: ${result.toStringAsFixed(2)} ",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                   new Padding(padding: const EdgeInsets.all(8.0)),

                     new Text("$_resultReading ",
                       style: new TextStyle(
                           color: Colors.pinkAccent,
                           fontWeight: FontWeight.w500,
                           fontStyle: FontStyle.italic,
                           fontSize: 30
                       ),)
                ],
              )
            ],
          )),
    );
  }

  calculateBmi() {
    if (_age.text.isNotEmpty &&
        int.parse(_age.text) < 120 &&
        _weight.text.isNotEmpty &&
        int.parse(_weight.text) < 150 &&
        _height.text.isNotEmpty &&
        int.parse(_height.text) < 190)
      return (int.parse(_weight.text) /
              int.parse(_height.text) /
              int.parse(_height.text) *
              10000);
    else
      return 0.0;
  }
}
