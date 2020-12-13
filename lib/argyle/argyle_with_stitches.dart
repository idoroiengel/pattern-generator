import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:pattern_generator/components/pattern_widget.dart';

class ArgyleWithStitches extends PatternWidget {
  @override
  _ArgyleWithStitchesState createState() => _ArgyleWithStitchesState();

  ArgyleWithStitches({
    Key key,
    primaryColor,
    firstColor,
    secondColor,
    tilesPerRow,
  }) : super(
          primaryColor: primaryColor,
          firstColor: firstColor,
          secondColor: secondColor,
          tilesPerRow: tilesPerRow,
        );
}

class _ArgyleWithStitchesState extends PatternWidgetState {
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
                          color: widget.determineTileColor(index),
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
                crossAxisCount: widget.tilesPerRow,
              ),
            ),
          );
        },
      ),
    );
  }
}
