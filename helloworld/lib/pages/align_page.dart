import 'package:flutter/material.dart';

class AlignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
//      width: 100,
//      height: 100,
      color: Colors.red,
      child: Align(
        //对齐方式
        //alignment: Alignment.centerRight,
        //对齐方式使用x,y表示 范围是-1~1之间
        alignment: Alignment(0.5,1),
        //父组件未指定高宽的情况下,按子容器的宽高进行缩放
        widthFactor: 3.0,
        heightFactor: 3.0,
        child: Container(
          width: 100,
          height: 50,
          color: Colors.purpleAccent,
          child: Text('align',style: TextStyle(color: Colors.lightGreen),),
        ),
      ),
    );
  }
}
