import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';

class ArgylePatternWithStitches extends StatefulWidget {
  @override
  _ArgylePatternWithStitchesState createState() =>
      _ArgylePatternWithStitchesState();
}

class _ArgylePatternWithStitchesState
    extends State<ArgylePatternWithStitches> {
  var primaryColor = Colors.grey;
  var firstColor = Colors.orange[800];
  var secondColor = Colors.yellow[400];
  var tilesPerRow = 5;
  var beginRowWithFirstColor = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryColor,
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
