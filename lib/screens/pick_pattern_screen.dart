import 'package:flutter/material.dart';
import 'package:pattern_generator/argyle/argyle_with_stitches.dart';
import 'package:pattern_generator/argyle/basic_argyle.dart';
import 'package:pattern_generator/checkerboard/basic_checkerboard.dart';
import 'package:pattern_generator/checkerboard/checkerboard_with_stitch_marks.dart';
import 'package:pattern_generator/components/color_and_color_picker_widget.dart';

class PickPatternScreenWidget extends StatefulWidget {
  @override
  _PickPatternScreenWidgetState createState() =>
      _PickPatternScreenWidgetState();
}

class _PickPatternScreenWidgetState extends State<PickPatternScreenWidget> {
  var showStitchMarks = false;

  List _patterns = ["checkerboard", "argyle"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentPattern;

  TextEditingController _tilesPerRowController;

  ColorAndColorPickerWidget firstColorWidget;
  ColorAndColorPickerWidget secondColorWidget;
  ColorAndColorPickerWidget primaryColorWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Pattern Generator",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Text("Pattern type:"),
                ),
                DropdownButton(
                  value: _currentPattern,
                  items: _dropDownMenuItems,
                  onChanged: changedDropDownItem,
                )
              ],
            ),
            Container(
              constraints: BoxConstraints.tightFor(
                width: 200,
              ),
              child: CheckboxListTile(
                activeColor: Colors.blue,
                value: showStitchMarks,
                onChanged: (bool checked) {
                  setState(() {
                    showStitchMarks = checked;
                  });
                },
                title: Text("Stitch marks"),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text("Tiles per row:"),
                ),
                Container(
                  constraints: BoxConstraints.tightFor(
                    width: 200,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _tilesPerRowController,
                    onEditingComplete: () => {},
                  ),
                ),
              ],
            ),
            firstColorWidget,
            secondColorWidget,
            primaryColorWidget,
            RaisedButton(
              onPressed: showPatternScreen,
              color: Colors.blue,
              child: Text(
                "Generate pattern",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentPattern = _dropDownMenuItems[0].value;
    super.initState();

    firstColorWidget = ColorAndColorPickerWidget(
      label: "First color",
    );
    secondColorWidget = ColorAndColorPickerWidget(
      label: "Second color",
    );
    primaryColorWidget = ColorAndColorPickerWidget(
      label: "Primary color",
    );

    _tilesPerRowController = TextEditingController();
  }

  @override
  void dispose() {
    _tilesPerRowController.dispose();
    super.dispose();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String pattern in _patterns) {
      items.add(new DropdownMenuItem(value: pattern, child: new Text(pattern)));
    }
    return items;
  }

  void changedDropDownItem(String selectedPattern) {
    setState(() {
      _currentPattern = selectedPattern;
    });
  }

  Widget determineDesiredPattern() {
    if (_currentPattern.contains("argyle")) {
      if (showStitchMarks) {
        print("argyle stitches");
        return ArgyleWithStitches(
          firstColor: firstColorWidget.widgetSelectedColor,
          secondColor: secondColorWidget.widgetSelectedColor,
          primaryColor: primaryColorWidget.widgetSelectedColor,
          tilesPerRow: int.parse(_tilesPerRowController.text),
        );
      } else {
        print("argyle plain");
        return ArgylePattern(
          firstColor: firstColorWidget.widgetSelectedColor,
          secondColor: secondColorWidget.widgetSelectedColor,
          primaryColor: primaryColorWidget.widgetSelectedColor,
          tilesPerRow: int.parse(_tilesPerRowController.text),
        );
      }
    } else if (_currentPattern.contains("checkerboard")) {
      if (showStitchMarks) {
        print("checkerboard stitches");
        return CheckerboardPatternWithStitches(
          firstColor: firstColorWidget.widgetSelectedColor,
          secondColor: secondColorWidget.widgetSelectedColor,
          primaryColor: primaryColorWidget.widgetSelectedColor,
          tilesPerRow: int.parse(_tilesPerRowController.text),
        );
      } else {
        print("checkerboard plain");
        return CheckerboardPattern(
          firstColor: firstColorWidget.widgetSelectedColor,
          secondColor: secondColorWidget.widgetSelectedColor,
          primaryColor: primaryColorWidget.widgetSelectedColor,
          tilesPerRow: int.parse(_tilesPerRowController.text),
        );
      }
    }
    return null;
  }

  void showPatternScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => determineDesiredPattern(),
      ),
    );
  }
}
