import 'package:flutter/material.dart';
import 'package:website/generated/res.dart';
import 'package:website/services/contact.dart';

class AboutContentPage extends StatefulWidget {
  @override
  _AboutContentState createState() => _AboutContentState();
}

class _AboutContentState extends State<AboutContentPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('给我留言'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              Res.company,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 40.0,
            ),
            SizedBox(
              width: 380.0,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: '请留言',
                  labelText: '请留言',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            SizedBox(
              width: 220.0,
              height: 48.0,
              child: RaisedButton(
                  child: Text(
                    '给我们留言',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  color: Colors.redAccent,
                  colorBrightness: Brightness.dark,
                  textColor: Colors.white,
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 5.0,
                    bottom: 5.0,
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1.0,
                      color: Colors.white,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                      bottomLeft: Radius.circular(4.0),
                      bottomRight: Radius.circular(4.0),
                    ),
                  ),
                  onPressed: () {
                    commit();
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void commit() {
    if (controller.text.length == 0) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('请输入内容'),
              ));
    } else {
      var info = contactCompany(controller.text);
      print(info);
    }
  }
}
