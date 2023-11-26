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
//定义一个内部类来管理小部件的状态。在这个例子中，状态变量是textToShow。
class _SampleAppPageState extends State<SampleAppPage> {
  // Default placeholder text.
  String textToShow = 'I Like Flutter';
//定义一个私有方法来更新textToShow的状态。当调用_updateText方法时，它会使用setState来更新文本。
  void _updateText() {
    setState(() {//setState()是Flutter中的一个方法，用于通知Flutter框架，某个小部件的状态已经发生了改变并重新构建这个小部件。
      // Update the text.
      textToShow = 'Flutter is Awesome!';
    });
  }
//重写build方法来定义小部件的外观。在这个例子中，它返回一个包含标题、文本和一个浮动按钮的Scaffold小部件。
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample App'),
      ),//在Scaffold中添加一个app bar，标题为"Sample App"。
      body: Center(child: Text(textToShow)),//在Scaffold的主体部分，将文本居中显示。文本的内容是从状态变量textToShow获取的。
      //在Scaffold中添加一个浮动按钮。当用户点击这个按钮时，它会触发_updateText方法，从而更新显示的文本。
      floatingActionButton: FloatingActionButton(
        onPressed: _updateText,
        tooltip: 'Update Text',
        child: const Icon(Icons.update),
      ),
    );
  }
}