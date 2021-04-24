import 'package:flutter/material.dart';
import 'package:new_test/constrains/constrain.dart';
import 'package:new_test/widgets/left_bar.dart';
import 'package:new_test/widgets/right_bar.dart';

class Home extends StatefulWidget {
  final double barWidth;

  const Home({Key key, this.barWidth}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 120,
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(color: primaryColor),
        ),
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: primaryColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: primaryColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    child: Text(
                      "CALCULATE",
                      style: TextStyle(color: primaryColor, fontSize: 30),
                    ),
                  ),
                  onTap: () {
                    double _h = double.parse(_heightController.text);
                    double _w = double.parse(_weightController.text);
                    setState(() {
                      _bmiResult = _w / (_h * _h);
                      if (_bmiResult > 25) {
                        _textResult = "You\'re over weight";
                      } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                        _textResult = "You have Normal Weight";
                      } else {
                        _textResult = "You have over weight";
                      }
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            LeftBar(
              barWidth: 50,
            ),
            SizedBox(
              height: 10,
            ),
            LeftBar(
              barWidth: 85,
            ),
            SizedBox(
              height: 10,
            ),
            LeftBar(barWidth: 50),
            SizedBox(
              height: 25,
            ),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(color: primaryColor, fontSize: 42),
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 32,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            RightBar(
              barWidth: 80,
            ),
            SizedBox(
              height: 30,
            ),
            RightBar(
              barWidth: 80,
            )
          ],
        ),
      ),
    );
  }
}
