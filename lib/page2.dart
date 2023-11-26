import 'package:flutter/material.dart';

void main() {
  runApp(const FadeAppTest());
}

class FadeAppTest extends StatelessWidget {
  const FadeAppTest({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fade Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyFadeTest(title: 'Fade Demo'),
    );
  }
}

class MyFadeTest extends StatefulWidget {
  const MyFadeTest({super.key, required this.title});

  final String title;
  @override
  State<MyFadeTest> createState() => _MyFadeTest();
}
//TickerProviderStateMixin是一个非常重要的mixin，它为你的widget提供了访问动画ticker的能力。
class _MyFadeTest extends State<MyFadeTest> with TickerProviderStateMixin {
  late AnimationController controller;
  late CurvedAnimation curve;

  @override
  void initState() {
    super.initState();
    //这个对象控制动画的时间和同步。这里，动画的持续时间是2000毫秒（2秒），
    controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,//VSync是垂直同步的简称，是一种处理屏幕撕裂的方法。它通过将显示器的刷新率与显卡输出的图像帧率同步，表示与这个Widget的同步（vsync: this）相关联。
    );
    // 这是一个曲线动画，它的父控制器是上面创建的controller，动画曲线是easeIn（即开始时慢，然后变快）。
    curve = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //这里使用了FadeTransition部件来实现渐变效果。渐变的透明度由上面创建的curve控制。FlutterLogo是一个包含在渐变效果中的部件。
      body: Center(
        child: FadeTransition(
          opacity: curve,
          child: const FlutterLogo(
            size: 100,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Fade',
        onPressed: () {
          controller.forward();//触发动画向前播放，
        },
        child: const Icon(Icons.brush),
      ),
    );
  }
}