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
//��ά����һ������б���Щ�����û�����Ļ���϶���ָʱ��¼��λ�á����û��϶���ָʱ��onPanUpdate�ص��ᱻ�����������µ��λ�á����û�ֹͣ�϶�ʱ��onPanEnd�ص��ᱻ�����������б������һ��null����ʾǩ���Ľ�����
class SignatureState extends State<Signature> {
  List<Offset?> _points = <Offset>[];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(//��GestureDetector��Flutter������Դ���һ�����������ʶ��ʹ��������¼������϶������ŵ�,�������û����϶��¼�������ÿ���϶�ʱ���µ��λ�á�
      onPanUpdate: (details) {
        setState(() {
          //�����Ǵ����û�����Ļ�ϵ����ƶ������������Ƶ�λ����Ϣ��ȫ������ת��Ϊ�����ĳ��RenderBox�ı������꣬Ȼ���������������ӵ��洢�������Ƶ���б��С�
          RenderBox? referenceBox = context.findRenderObject() as RenderBox;
          Offset localPosition =
          referenceBox.globalToLocal(details.globalPosition);
          _points = List.from(_points)..add(localPosition);
        });
      },
      onPanEnd: (details) => _points.add(null),
      child: CustomPaint(
        painter: SignaturePainter(_points),
        size: Size.infinite,
      ),
    );
  }
}
//�������չ��CustomPainter�����ڻ���ǩ�������ڻ����ϻ���һϵ�е��ߣ�ÿ���߶�Ӧ�û�����Ļ���϶���һ���㡣�ߵ���ɫ���˵�Ϳ�ȶ�����ͨ��paint������п��ơ�
class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);
  final List<Offset?> points;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(SignaturePainter oldDelegate) =>
      oldDelegate.points != points;
}