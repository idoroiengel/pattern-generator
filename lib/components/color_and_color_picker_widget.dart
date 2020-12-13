import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorAndColorPickerWidget extends StatefulWidget {
  @override
  _ColorAndColorPickerWidgetState createState() =>
      _ColorAndColorPickerWidgetState();

  final String label;

  // the color value that is updated to let user know his choice
  Color widgetSelectedColor;

  ColorAndColorPickerWidget({this.label});
}

class _ColorAndColorPickerWidgetState extends State<ColorAndColorPickerWidget> {
  void changeColor(Color color) => setState(() => {
        stateSelectedColor = color,
        widget.widgetSelectedColor = stateSelectedColor,
      });

  // the Widget's color that changes UI when user selects color
  Color stateSelectedColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: RaisedButton(
            child: Text(
              widget.label,
            ),
            onPressed: () {
              showDialog(
                context: context,
                child: AlertDialog(
                  title: const Text('Pick a color!'),
                  content: SingleChildScrollView(
                    child: ColorPicker(
                      pickerColor: stateSelectedColor,
                      onColorChanged: changeColor,
                      showLabel: true,
                      pickerAreaHeightPercent: 0.8,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        RaisedButton(
          onPressed: null,
          disabledColor: stateSelectedColor,
        )
      ],
    );
  }
}
