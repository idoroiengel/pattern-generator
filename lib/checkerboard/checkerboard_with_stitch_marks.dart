import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:pattern_generator/components/pattern_widget.dart';

class CheckerboardPatternWithStitches extends PatternWidget {
  @override
  _CheckerboardPatternWithStitchesState createState() =>
      _CheckerboardPatternWithStitchesState();

  CheckerboardPatternWithStitches({
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
            tilesPerRow: tilesPerRow);
}

class _CheckerboardPatternWithStitchesState extends PatternWidgetState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InteractiveViewer(
        child: Container(
          color: widget.primaryColor,
          child: GridView.builder(
            itemCount: 64,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(1.0),
                    color: widget.determineTileColor(index),
                  ),
                  Center(
                    child: Dash(
                      direction: Axis.horizontal,
                      dashColor: Colors.black,
                      dashLength: 10.0,
                      dashThickness: 1.0,
                      length: 120.0,
                      dashGap: 5,
                    ),
                  ),
                  Center(
                    child: Dash(
                      direction: Axis.vertical,
                      dashColor: Colors.black,
                      dashLength: 10.0,
                      dashThickness: 1.0,
                      length: 120.0,
                      dashGap: 5,
                    ),
                  ),
                ],
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.tilesPerRow,
            ),
          ),
        ),
      ),
    );
  }
}
