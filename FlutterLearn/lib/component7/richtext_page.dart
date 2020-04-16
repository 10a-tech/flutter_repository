import 'package:flutter/material.dart';

class TichText extends StatefulWidget {
  @override
  _TichTextState createState() => _TichTextState();
}

class _TichTextState extends State<TichText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TichText'),
      ),
      body: Center(
        child: RichText(
          text: TextSpan(
            text: 'i ',
            style: TextStyle(fontSize: 38.0, color: Colors.green),
            children: <TextSpan>[
              TextSpan(
                  text: 'want',
                  style: TextStyle(
                      fontSize: 38.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red)),
              TextSpan(
                  text: 'study',
                  style: TextStyle(
                      fontSize: 38.0,
                      fontStyle: FontStyle.italic,
                      color: Colors.deepPurple)),
              TextSpan(
                  text: 'flutter',
                  style: TextStyle(
                      fontSize: 38.0,
                      fontStyle: FontStyle.italic,
                      color: Colors.lightGreen)),
            ],
          ),
        ),
      ),
    );
  }
}
