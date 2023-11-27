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
          title: Text('RelativeLayout in Flutter'),
        ),
        body: MyRelativeLayout(),
      ),
    );
  }
}

class MyRelativeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Stack is a widget that displays its children in a stack format.
    return Stack(//类似Android中的FrameLayout
      children: <Widget>[
        // Positioned widget is used to position the child widgets in the Stack.
        Positioned(
          top: 0,
          left: 0,
          child: Icon(
            Icons.star,
            size: 50,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Icon(
            Icons.star,
            size: 50,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Icon(
            Icons.star,
            size: 50,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Icon(
            Icons.star,
            size: 50,
          ),
        ),
        // Center widget is used to center the child widget in the Stack.
        Center(
          child: Text(
            'Center Text',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ],
    );
  }
}