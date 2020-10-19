import 'dart:math';

import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

class ArgylePattern extends StatefulWidget {
  @override
  _ArgylePatternState createState() => _ArgylePatternState();
}

class _ArgylePatternState extends State<ArgylePattern> {
  var primaryColor = Colors.blue;
  var firstColor = Colors.orange;
  var secondColor = Colors.red;
  var tilesPerRow = 7;
  var beginRowWithPrimaryColor = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryColor,
        child: GridView.builder(
          itemCount: 50,
          itemBuilder: (BuildContext context, int index) {
            return Transform(
              transform: Matrix4Transform()
                  .rotateDegrees(
                    45.0,
                    origin: Offset(50, 0).scale(0.5, 1),
                  )
                  .matrix4,
              child: Container(
                margin: EdgeInsets.all(
                  12.0,
                ),
                color: determineTileColor(index),
              ),
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
        beginRowWithPrimaryColor = !beginRowWithPrimaryColor;
      }
      if (beginRowWithPrimaryColor) {
        if (index % 2 == 0) {
          return primaryColor;
        } else {
          return secondColor;
        }
      } else {
        if (index % 2 == 0) {
          return firstColor;
        } else {
          return primaryColor;
        }
      }
    }
    return null;
  }
}
