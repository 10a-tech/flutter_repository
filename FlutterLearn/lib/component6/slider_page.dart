import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Slider(
        value: value,
        min: 0.0,
        max: 100.0,
        label: '当前音量是:$value',
        //活动部分
        activeColor: Colors.green,
        //为活动部分
        inactiveColor: Colors.lightGreen,
        //分段条数
        divisions: 10,
        onChanged: (val) {
          setState(() {
            value = val.roundToDouble();
          });
        },
        onChangeStart: (val) {},
        onChangeEnd: (val) {},
      ),
    );
  }
}
