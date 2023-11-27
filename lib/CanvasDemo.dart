import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: DemoApp()));

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(body: Signature());
}

class Signature extends StatefulWidget {
  const Signature({super.key});

  @override
  SignatureState createState() => SignatureState();
}
//并维护了一个点的列表，这些点是用户在屏幕上拖动手指时记录的位置。当用户拖动手指时，onPanUpdate回调会被触发，并更新点的位置。当用户停止拖动时，onPanEnd回调会被触发，并在列表中添加一个null，表示签名的结束。
class SignatureState extends State<Signature> {
  List<Offset?> _points = <Offset>[];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(//，GestureDetector是Flutter框架中自带的一个组件，用于识别和处理手势事件，如拖动、缩放等,它监听用户的拖动事件，并在每次拖动时更新点的位置。
      // 当用户触摸屏幕并拖动时触发，该回调会接收一个details参数，包含触摸事件的详细信息
      onPanUpdate: (details) {
        setState(() {
          //RederBox对象表示组件在屏幕上的几何形状和位置信息，并将手势的位置信息从全局坐标转换为相对于某个RenderBox的本地坐标，然后将这个本地坐标添加到存储所有手势点的列表中。
          RenderBox? referenceBox = context.findRenderObject() as RenderBox;
          // 将全局坐标转换为局部坐标，以便在SignaturePainter中绘制
          Offset localPosition =
          referenceBox.globalToLocal(details.globalPosition);
          // 存储用户绘制的点
          _points = List.from(_points)..add(localPosition);
        });
      },
      // 用户松开手指时触发，将null添加到点列表中，表示绘制结束
      onPanEnd: (details) => _points.add(null),
      // 并设置组件的大小为无限大，即占满整个屏幕
      child: CustomPaint(
        painter: SignaturePainter(_points),
        size: Size.infinite,
      ),
    );
  }
}
//这个类扩展了CustomPainter，用于绘制签名。它在画布上绘制一系列的线，每条线对应用户在屏幕上拖动的一个点。线的颜色、端点和宽度都可以通过paint对象进行控制。
class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);
  final List<Offset?> points;
  @override
  // 并设置组件的大小为无限大，即占满整个屏幕
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;
    // 遍历点列表，当前点和下一个点都不为Null，绘制从当前点到下个点的线段
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }
  // 判断是否需要重新绘制签名，新旧点数组比较，如果新旧点数组不同，那么就需要重新绘制。
  @override
  bool shouldRepaint(SignaturePainter oldDelegate) =>
      oldDelegate.points != points;
}