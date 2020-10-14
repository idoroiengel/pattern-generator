import 'dart:math';

import 'package:flutter/material.dart';

class ArgylePattern extends StatefulWidget {
  @override
  _ArgylePatternState createState() => _ArgylePatternState();
}

class _ArgylePatternState extends State<ArgylePattern> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GridView.count(
          crossAxisCount: 9,
          children: [
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.red[800],
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.red[800],
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.red[800],
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.red[800],
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.red[800],
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.orange[400],
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.orange[400],
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.orange[400],
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.orange[400],
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.red[800],
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.red[800],
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.red[800],
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.red[800],
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.red[800],
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.orange[400],
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.orange[400],
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.orange[400],
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.orange[400],
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
