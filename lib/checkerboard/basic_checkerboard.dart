import 'dart:math';

import 'package:flutter/material.dart';

class CheckerboardPattern extends StatefulWidget {
  Color primaryColor = Colors.grey;
  Color firstColor = Colors.orange[800];
  Color secondColor = Colors.yellow[400];
  var tilesPerRow = 4;

  @override
  _CheckerboardPatternState createState() => _CheckerboardPatternState();

  CheckerboardPattern({
    this.primaryColor,
    this.firstColor,
    this.secondColor,
    this.tilesPerRow,
  });
}

class _CheckerboardPatternState extends State<CheckerboardPattern> {
  var _beginRowWithFirstColor = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: widget.primaryColor,
        child: GridView.builder(
          itemCount: 64,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: determineTileColor(index),
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
        _beginRowWithFirstColor = !_beginRowWithFirstColor;
      }
      if (_beginRowWithFirstColor) {
        if (index % 2 == 0) {
          return widget.firstColor;
        } else {
          return widget.secondColor;
        }
      } else {
        if (index % 2 == 0) {
          return widget.secondColor;
        } else {
          return widget.firstColor;
        }
      }
    }
    return null;
  }
}
