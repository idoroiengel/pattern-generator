import 'package:flutter/material.dart';

class ArgylePattern extends StatefulWidget {
  @override
  _ArgylePatternState createState() => _ArgylePatternState();
}

class _ArgylePatternState extends State<ArgylePattern> {
  var primaryColor = Colors.blue;
  var firstColor = Colors.red[800];
  var secondColor = Colors.white;
  var tilesPerRow = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryColor,
        child: GridView.builder(
          itemCount: 40,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: determineTileColor(index),
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: tilesPerRow,
          ),
        ),
      ),
    );
  }

  Color determineTileColor(int index) {
    if (index % 2 == 0) {
      return firstColor;
    } else {
      return secondColor;
    }
  }
}
