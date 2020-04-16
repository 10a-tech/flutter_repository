import 'package:flutter/material.dart';

class TablPage extends StatefulWidget {
  @override
  _TablPageState createState() => _TablPageState();
}

class _TablPageState extends State<TablPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table'),
      ),
      body: Table(
        columnWidths: {
          0: FixedColumnWidth(50.0),
          1: FixedColumnWidth(100.0),
          2: FixedColumnWidth(50.0),
          3: FixedColumnWidth(120.0),
          4: FixedColumnWidth(120.0),
        },
        border: TableBorder.all(
          color: Colors.black,
          width: 2.0,
          style: BorderStyle.solid,
        ),
        children: [
          TableRow(
            //调整背景色
            decoration: BoxDecoration(color: Colors.black38),
            children: [
              //增加行高
              SizedBox(
                height: 30.0,
                child: Text(
                  '序号',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text('外包单位名称', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('姓名', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('员工到工作地时间', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('是否超过14天隔离期', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          TableRow(
            children: [
              Text('张三'),
              Text('男'),
              Text('28'),
              Text('28'),
              Text('28'),
            ],
          ),
          TableRow(
            children: [
              Text('李四'),
              Text('女'),
              Text('17'),
              Text('28'),
              Text('28'),
            ],
          ),
          TableRow(
            children: [
              Text('王五'),
              Text('男'),
              Text('45'),
              Text('28'),
              Text('28'),
            ],
          ),
          TableRow(
            children: [
              Text('王五'),
              Text('男'),
              Text('45'),
              Text('28'),
              Text('28'),
            ],
          ),
          TableRow(
            children: [
              Text('王五'),
              Text('男'),
              Text('45'),
              Text('28'),
              Text('28'),
            ],
          ),
          TableRow(
            children: [
              Text('王五'),
              Text('男'),
              Text('45'),
              Text('28'),
              Text('28'),
            ],
          ),
          TableRow(
            children: [
              Text('王五'),
              Text('男'),
              Text('45'),
              Text('28'),
              Text('28'),
            ],
          ),
          TableRow(
            children: [
              Text('王五'),
              Text('男'),
              Text('45'),
              Text('28'),
              Text('28'),
            ],
          ),
          TableRow(
            children: [
              Text('王五'),
              Text('男'),
              Text('45'),
              Text('28'),
              Text('28'),
            ],
          ),
          TableRow(
            children: [
              Text('王五'),
              Text('男'),
              Text('45'),
              Text('28'),
              Text('28'),
            ],
          ),
          TableRow(
            children: [
              Text('王五'),
              Text('男'),
              Text('45'),
              Text('28'),
              Text('28'),
            ],
          ),
          TableRow(
            children: [
              Text('王五'),
              Text('男'),
              Text('45'),
              Text('28'),
              Text('28'),
            ],
          ),
          TableRow(
            children: [
              Text('王五'),
              Text('男'),
              Text('45'),
              Text('28'),
              Text('28'),
            ],
          ),
          TableRow(
            children: [
              Text('王五'),
              Text('男'),
              Text('45'),
              Text('28'),
              Text('28'),
            ],
          ),
          TableRow(
            children: [
              Text('王五'),
              Text('男'),
              Text('45'),
              Text('28'),
              Text('28'),
            ],
          ),
        ],
      ),
    );
  }
}
