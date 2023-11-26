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
//TickerProviderStateMixin��һ���ǳ���Ҫ��mixin����Ϊ���widget�ṩ�˷��ʶ���ticker��������
class _MyFadeTest extends State<MyFadeTest> with TickerProviderStateMixin {
  late AnimationController controller;
  late CurvedAnimation curve;

  @override
  void initState() {
    super.initState();
    //���������ƶ�����ʱ���ͬ������������ĳ���ʱ����2000���루2�룩��
    controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,//VSync�Ǵ�ֱͬ���ļ�ƣ���һ�ִ�����Ļ˺�ѵķ�������ͨ������ʾ����ˢ�������Կ������ͼ��֡��ͬ������ʾ�����Widget��ͬ����vsync: this���������
    );
    // ����һ�����߶��������ĸ������������洴����controller������������easeIn������ʼʱ����Ȼ���죩��
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
      //����ʹ����FadeTransition������ʵ�ֽ���Ч���������͸���������洴����curve���ơ�FlutterLogo��һ�������ڽ���Ч���еĲ�����
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
          controller.forward();//����������ǰ���ţ�
        },
        child: const Icon(Icons.brush),
      ),
    );
  }
}