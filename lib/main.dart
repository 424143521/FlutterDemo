import 'package:flutter/material.dart';
//����Ӧ�ó������ڵ㡣���������������ʱ������������������ΪSampleApp��Ӧ�ó���
void main() {
  runApp(const SampleApp());//const��ʾ���ܸı���������ζ���㲻���ڴ������޸������κ����Ի���������κη�����
}
// ����һ����״̬��С��������������Ӧ�ó���ĸ�����build�����У�������һ��MaterialAppС����������Ӧ�ó������Ҫ������
class SampleApp extends StatelessWidget {
  const SampleApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //����һ��MaterialAppС������ΪӦ�ó������Ҫ������
    return MaterialApp(
      title: 'Sample App',// ����Ӧ�ó���ı��⡣
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),//����Ӧ�ó����������ɫΪ����ɫ��
      home: const SampleAppPage(),//����Ӧ�ó������ҳ��
    );
  }
}
//����һ����״̬��С���������������û���Ӧ�ó��򽻻�ʱ�����仯��
class SampleAppPage extends StatefulWidget {
  // ��һ������Ĺ��캯����������һ����Ϊsuper.key�Ĳ�����super.key��Flutter������Ψһ��ʶС�����������������ʹ��const�ؼ�������Ϊ������캯��û�н����κ�״̬���û��޸ģ����Կ��Ա���Ϊ�ǡ�ֻ�����ġ�
  const SampleAppPage({super.key});

  @override
  State<SampleAppPage> createState() => _SampleAppPageState();//ΪС��������һ��״̬��
}
//����һ���ڲ���������С������״̬������������У�״̬������textToShow��
class _SampleAppPageState extends State<SampleAppPage> {
  // Default placeholder text.
  String textToShow = 'I Like Flutter';
//����һ��˽�з���������textToShow��״̬��������_updateText����ʱ������ʹ��setState�������ı���
  void _updateText() {
    setState(() {//setState()��Flutter�е�һ������������֪ͨFlutter��ܣ�ĳ��С������״̬�Ѿ������˸ı䲢���¹������С������
      // Update the text.
      textToShow = 'Flutter is Awesome!';
    });
  }
//��дbuild����������С��������ۡ�����������У�������һ���������⡢�ı���һ��������ť��ScaffoldС������
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample App'),
      ),//��Scaffold�����һ��app bar������Ϊ"Sample App"��
      body: Center(child: Text(textToShow)),//��Scaffold�����岿�֣����ı�������ʾ���ı��������Ǵ�״̬����textToShow��ȡ�ġ�
      //��Scaffold�����һ��������ť�����û���������ťʱ�����ᴥ��_updateText�������Ӷ�������ʾ���ı���
      floatingActionButton: FloatingActionButton(
        onPressed: _updateText,
        tooltip: 'Update Text',
        child: const Icon(Icons.update),
      ),
    );
  }
}