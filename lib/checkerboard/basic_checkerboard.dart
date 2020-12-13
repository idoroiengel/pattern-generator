import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pattern_generator/components/pattern_widget.dart';

class CheckerboardPattern extends PatternWidget {
  @override
  _CheckerboardPatternState createState() => _CheckerboardPatternState();

  CheckerboardPattern({
    Key key,
    primaryColor,
    firstColor,
    secondColor,
    tilesPerRow,
  }) : super(
          key: key,
          firstColor: firstColor,
          secondColor: secondColor,
          primaryColor: primaryColor,
          tilesPerRow: tilesPerRow,
        );
}

class _CheckerboardPatternState extends PatternWidgetState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: widget.primaryColor,
        child: GridView.builder(
          itemCount: 64,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: widget.determineTileColor(index),
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
