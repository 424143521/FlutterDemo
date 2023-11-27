import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Linear Layout in Flutter'),
        ),
        body: MyLinearLayout(),
      ),
    );
  }
}

class MyLinearLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Column is a widget that displays its children in a vertical array.
    return Column(
      // mainAxisAlignment property is used to align the children along the vertical axis.
      mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment property is used to align the children along the horizontal axis.
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Adding multiple widgets (like Text, Icon etc.) inside the Column
        Text(
          'Text 1',
          style: TextStyle(fontSize: 24),
        ),
        Text(
          'Text 2',
          style: TextStyle(fontSize: 24),
        ),
        Icon(
          Icons.star,
          size: 50,
        ),
      ],
    );
  }
}