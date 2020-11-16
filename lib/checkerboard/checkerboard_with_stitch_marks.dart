import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';

class CheckerboardPatternWithStitches extends StatefulWidget {
  Color primaryColor = Colors.grey;
  Color firstColor = Colors.orange[800];
  Color secondColor = Colors.yellow[400];
  var tilesPerRow = 5;

  @override
  _CheckerboardPatternWithStitchesState createState() =>
      _CheckerboardPatternWithStitchesState();

  CheckerboardPatternWithStitches({
    this.primaryColor,
    this.firstColor,
    this.secondColor,
    this.tilesPerRow,
  });
}

class _CheckerboardPatternWithStitchesState
    extends State<CheckerboardPatternWithStitches> {
  var _beginRowWithFirstColor = true;

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
                    color: determineTileColor(index),
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
