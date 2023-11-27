import 'package:flutter/material.dart';
//这是应用程序的入口点。当你运行这个程序时，它会启动并运行名为SampleApp的应用程序。
void main() {
  runApp(const SampleApp());//const表示不能改变它，这意味着你不能在创建后修改它的任何属性或调用它的任何方法。
}
// 定义一个无状态的小部件，它是整个应用程序的根。在build方法中，它返回一个MaterialApp小部件，这是应用程序的主要容器。
class SampleApp extends StatelessWidget {
  const SampleApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //返回一个MaterialApp小部件作为应用程序的主要容器。
    return MaterialApp(
      title: 'Sample App',// 设置应用程序的标题。
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),//设置应用程序的主题颜色为深紫色。
      home: const SampleAppPage(),//设置应用程序的主页面
    );
  }
}
//定义一个有状态的小部件，它将会在用户与应用程序交互时发生变化。
class SampleAppPage extends StatefulWidget {
  // 这一行是类的构造函数，它接收一个名为super.key的参数。super.key是Flutter中用于唯一标识小部件的特殊对象。这里使用const关键字是因为这个构造函数没有进行任何状态设置或修改，所以可以被认为是“只读”的。
  const SampleAppPage({super.key});

  @override
  State<SampleAppPage> createState() => _SampleAppPageState();//为小部件创建一个状态。
}
class _SampleAppPageState extends State<SampleAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample App'),
      ),
      body: ListView(children: _getListData()),
    );
  }

  List<Widget> _getListData() {
    List<Widget> widgets = [];
    for (int i = 0; i < 100; i++) {
      widgets.add(GestureDetector(//把列表项Widget放到一个GestureDetector 里，传入onTap属性来实现点击监听。
        onTap: () {
          print('Row i was tapped!');
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text('Row i'),
        ),
      ));
    }
    return widgets;
  }
}
