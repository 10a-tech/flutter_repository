import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  //文本编辑控制器
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              //TextCapitalization.words 每个单词首字母大写
              //TextCapitalization.sentences 首字母大写
              //TextCapitalization.characters 全大写
              textCapitalization: TextCapitalization.characters,
              //键盘类型
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  icon: Icon(Icons.person),
                  labelText: '请输入你的用户名',
                  helperText: '请输入注册的用户名'),
              //光标样式修改
              cursorColor: Colors.green,
              cursorRadius: Radius.circular(8.0),
              cursorWidth: 16.0,
              //操作按钮
              textInputAction: TextInputAction.go,
              controller: usernameController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                icon: Icon(Icons.lock),
                labelText: '请输入密码',
              ),
              controller: passwordController,
            ),
            RaisedButton(
              onPressed: () {
                loginCheck();
              },
              child: Container(
                alignment: Alignment.center,
                child: Text('登陆'),
              ),
              color: Colors.deepOrange,
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '用户名',
                hintText: '请输入你的用户名',
                prefixIcon: Icon(Icons.person),
                suffixIcon: Icon(Icons.print),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loginCheck() {
    if (usernameController.text.length != 11) {
      print('用户名长度不等于11');
    }
  }
}
