import 'package:flutter/material.dart';
import 'package:untitled/CanvasDemo.dart' as lib1;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => MyHomePage(),
        '/PageA': (context) => PageA(),
        '/PageB': (context) => PageB(),
        '/Page4': (context) => lib1.Signature()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page5'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('page1'),
              onPressed: () {
                Navigator.pushNamed(context, '/PageA');//通过路由名 压栈 (push) 到 Navigator 中来跳转到这个 route。
              },
            ),
            ElevatedButton(
              child: Text('page2'),
              onPressed: () {
                Navigator.pushNamed(context, '/PageB');
              },
            ),
            ElevatedButton(
              child: Text('page4'),
              onPressed: () {
                Navigator.pushNamed(context, '/Page4');
              },
            )
          ],
        ),
      ),
    );
  }
}

class PageA extends StatefulWidget {
  @override
  _PageAState createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page A'),
      ),
      body: Center(
        child:  ElevatedButton(
          child: Text('page'),
          onPressed: () {
            Navigator.pushNamed(context, '/');//通过路由名 压栈 (push) 到 Navigator 中来跳转到这个 route。
          },
        ),
      ),
    );
  }
}

class PageB extends StatefulWidget {
  @override
  _PageBState createState() => _PageBState();
}

class _PageBState extends State<PageB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page B'),
      ),
      body: Center(
        child: Text('Page B'),
      ),
    );
  }
}