import 'package:flutter/material.dart';

class PatternWidget extends StatefulWidget {
  Color primaryColor = Colors.blue;
  Color firstColor = Colors.orange;
  Color secondColor = Colors.red;
  var tilesPerRow = 7;

  var _beginRowWithPrimaryColor = true;

  @override
  PatternWidgetState createState() => PatternWidgetState();

  PatternWidget({
    Key key,
    this.primaryColor,
    this.firstColor,
    this.secondColor,
    this.tilesPerRow,
  }) : super(key: key);

  Color determineTileColor(int index) {
    if (tilesPerRow.isOdd) {
      if (index % 2 == 0) {
        return firstColor;
      } else {
        return secondColor;
      }
    } else if (tilesPerRow.isEven) {
      if (index % tilesPerRow == 0) {
        _beginRowWithPrimaryColor = !_beginRowWithPrimaryColor;
      }
      if (_beginRowWithPrimaryColor) {
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

class PatternWidgetState extends State<PatternWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Pattern widget"
      ),
    );
  }
}
