import 'package:flutter/material.dart';

class SliderThemePage extends StatefulWidget {
  @override
  _SliderThemePageState createState() => _SliderThemePageState();
}

class _SliderThemePageState extends State<SliderThemePage> {
  double value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliderTheme'),
      ),
      body: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          //实际进度的颜色
          activeTrackColor: Colors.yellow,
          //未拖动颜色
          inactiveTrackColor: Colors.red,
          //提示进度气泡背景色
          valueIndicatorColor: Colors.green,
          //提示进度的气泡文本颜色
          valueIndicatorTextStyle: TextStyle(color: Colors.white60),
          //滑块中心颜色
          thumbColor: Colors.blueAccent,
          //滑块边缘颜色
          overlayColor: Colors.white,
          //divisions对进度线分割后,线段点颜色
          inactiveTickMarkColor: Colors.black,
        ),
        child: Slider(
          value: value,
          label: '$value',
          min: 0.0,
          max: 100.0,
          divisions: 100,
          //设置后出提示气泡
          onChanged: (val) {
            setState(() {
              value = val.floorToDouble();
            });
          },
        ),
      ),
    );
  }
}
