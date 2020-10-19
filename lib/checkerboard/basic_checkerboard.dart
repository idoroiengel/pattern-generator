import 'dart:math';

import 'package:flutter/material.dart';

class CheckerboardPattern extends StatefulWidget {
  @override
  _CheckerboardPatternState createState() => _CheckerboardPatternState();
}

class _CheckerboardPatternState extends State<CheckerboardPattern> {
  var primaryColor = Colors.grey;
  var firstColor = Colors.orange[800];
  var secondColor = Colors.yellow[400];
  var tilesPerRow = 4;
  var beginRowWithFirstColor = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryColor,
          child: GridView.builder(
            itemCount: 64,
            itemBuilder: (BuildContext context, int index) {
              return
                // Transform.rotate(
                // angle: pi / 4,
                // child:
              Container(
                  color: determineTileColor(index),
                // ),
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
    if (tilesPerRow.isOdd) {
      if (index % 2 == 0) {
        return firstColor;
      } else {
        return secondColor;
      }
    } else if (tilesPerRow.isEven) {
      if (index % tilesPerRow == 0) {
        beginRowWithFirstColor = !beginRowWithFirstColor;
      }
      if (beginRowWithFirstColor) {
        if (index % 2 == 0) {
          return firstColor;
        } else {
          return secondColor;
        }
      } else {
        if (index % 2 == 0) {
          return secondColor;
        } else {
          return firstColor;
        }
      }
    }
    return null;
  }
}
