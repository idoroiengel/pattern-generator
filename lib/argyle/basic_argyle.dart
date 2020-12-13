import 'dart:math';

import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:pattern_generator/components/pattern_widget.dart';

class ArgylePattern extends PatternWidget {
  @override
  _ArgylePatternState createState() => _ArgylePatternState();

  ArgylePattern({
    Key key,
    primaryColor,
    firstColor,
    secondColor,
    tilesPerRow,
  }) : super(
          key: key,
          primaryColor: primaryColor,
          firstColor: firstColor,
          secondColor: secondColor,
          tilesPerRow: tilesPerRow,
        );
}

class _ArgylePatternState extends PatternWidgetState {
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
                color: widget.determineTileColor(index),
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
}
