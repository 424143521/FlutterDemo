/**
 * . 如何为Widget添加点击监听器
    在Android中可以调用 setOnClickListener 为View添加点击监听器，而在Flutter中有两种添加监听的方法：

    Widget 支持事件监听，在处理事件的参数传入具体操作，比如 RaisedButton 的 onPressed 参数；
    不支持事件监听，可以把 Widget 丢到一个 GestureDetector 中并向它的 onTap 参数传递具体操作；

 */
import 'package:flutter/material.dart';
void main() {
  runApp(const SampleApp());
}
class SampleApp extends StatelessWidget {
  const SampleApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SampleTapApp(),
    );
  }
}
class SampleTapApp extends StatelessWidget {
  const SampleTapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Text('test'),
                );
              },
            );
          },
          child: const FlutterLogo(
            size: 200,
          ),
        ),
      ),
    );
  }
}
