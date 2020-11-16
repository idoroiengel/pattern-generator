import 'dart:math';

import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

class ArgylePattern extends StatefulWidget {
  Color primaryColor = Colors.blue;
  Color firstColor = Colors.orange;
  Color secondColor = Colors.red;
  var tilesPerRow = 7;

  @override
  _ArgylePatternState createState() => _ArgylePatternState();

  ArgylePattern({
    this.primaryColor,
    this.firstColor,
    this.secondColor,
    this.tilesPerRow,
  });
}

class _ArgylePatternState extends State<ArgylePattern> {
  var _beginRowWithPrimaryColor = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: widget.primaryColor,
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
            crossAxisCount: widget.tilesPerRow,
          ),
        ),
      ),
    );
  }

  Color determineTileColor(int index) {
    if (widget.tilesPerRow.isOdd) {
      if (index % 2 == 0) {
        return widget.firstColor;
      } else {
        return widget.secondColor;
      }
    } else if (widget.tilesPerRow.isEven) {
      if (index % widget.tilesPerRow == 0) {
        _beginRowWithPrimaryColor = !_beginRowWithPrimaryColor;
      }
      if (_beginRowWithPrimaryColor) {
        if (index % 2 == 0) {
          return widget.primaryColor;
        } else {
          return widget.secondColor;
        }
      } else {
        if (index % 2 == 0) {
          return widget.firstColor;
        } else {
          return widget.primaryColor;
        }
      }
    }
    return null;
  }
}
