import 'package:flutter/material.dart';

void main() {
runApp(MyApp());
}
//有时候我们需要根据用户的交互动态地添加或删除列表项。这就需要使用动态列表。在动态列表中，列表项是存储在一个列表变量中的，当用户进行某些操作时，我们可以在这个列表变量中添加或删除元素，然后调用`setState`方法来更新UI。
class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Sample App',
theme: ThemeData(
primarySwatch: Colors.blue,
),
home: MyHomePage(),
);
}
}

class MyHomePage extends StatefulWidget {
@override
_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
List<Widget> widgets = [];

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Sample App'),
),
body: ListView.builder(//俩个参数列表初始长度 和 ItemBuilder方法
itemCount: widgets.length,
itemBuilder: (context, position) {
return getRow(position);//返回每个列表项的内容
},
),
floatingActionButton: FloatingActionButton(
onPressed: () {
setState(() {
widgets.add(getRow(widgets.length));
});
},
tooltip: 'Increment',
child: Icon(Icons.add),
),
);
}

Widget getRow(int i) {
return GestureDetector(
child: Padding(
padding: EdgeInsets.all(10.0),
child: Text("Row $i"),
),
onTap: () {
setState(() {
widgets.add(getRow(widgets.length));
});
},
);
}
}