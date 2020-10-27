import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

class ArgyleWithStitches extends StatefulWidget {
  @override
  _ArgyleWithStitchesState createState() => _ArgyleWithStitchesState();
}

class _ArgyleWithStitchesState extends State<ArgyleWithStitches> {
  var primaryColor = Colors.blue;
  var firstColor = Colors.orange;
  var secondColor = Colors.red;
  var tilesPerRow = 3;
  var beginRowWithPrimaryColor = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext layoutContext, BoxConstraints constraints) {
          return Container(
            color: Colors.grey,
            child: GridView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(
                    0.0,
                  ),
                  child: Transform(
                    transform: Matrix4Transform()
                        .rotateDegrees(
                          45.0,
                          origin: Offset(50, 0),
                        )
                        .matrix4,
                    child: Stack(
                      children: [
                        Container(
                          color: determineTileColor(index),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Dash(
                            direction: Axis.horizontal,
                            dashColor: Colors.white,
                            dashThickness: 1.0,
                            dashGap: 5,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Dash(
                            direction: Axis.vertical,
                            dashColor: Colors.black,
                            dashThickness: 1.0,
                            dashGap: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: tilesPerRow,
              ),
            ),
          );
        },
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
