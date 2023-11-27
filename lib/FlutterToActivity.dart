import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/**
 * 这段代码的功能是：点击浮动按钮后，会通过MethodChannel调用原生代码的`startNativeActivity`方法，然后将返回的结果显示在屏幕中央。如果调用失败，会打印错误信息。
 */
void main() {
  runApp(const SampleApp());
}

class SampleApp extends StatelessWidget {
  const SampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  const SampleAppPage({Key? key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  String textToShow = 'I Like Flutter';
  static const platform = const MethodChannel('com.example.app/channel');

  void _updateText() async {
    try {
      final result = await platform.invokeMethod('startNativeActivity');
      setState(() {
        textToShow = result;
      });
    } on PlatformException catch (e) {
      print("Failed to start native activity: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample App'),
      ),
      body: Center(child: Text(textToShow)),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateText,
        tooltip: 'Update Text',
        child: const Icon(Icons.update),
      ),
    );
  }
}