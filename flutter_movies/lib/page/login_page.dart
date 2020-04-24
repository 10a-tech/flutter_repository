import 'package:flutter/material.dart';
import 'package:flutter_movies/model/user_model.dart';
import 'package:flutter_movies/page/movies_page.dart';
import 'package:flutter_movies/bean/theme_data_bean.dart';
import 'package:flutter_movies/bean/user_bean.dart';
import 'package:flutter_movies/service/user_login_service.dart';
import 'package:flutter_movies/widget/provider_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登陆"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Provider.of<ThemeDataBean>(context, listen: false).change();
              },
              child: Icon(Icons.brightness_6),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _controller,
                autofocus: true,
              ),
              SizedBox(
                height: 20,
              ),
              ProviderWidget<UserModel>(
                model: UserModel(Provider.of<UserLoginService>(context)),
                builder: (context, model, child) {
                  if (model.loading) {
                    return CircularProgressIndicator();
                  } else {
                    return FlatButton(
                      onPressed: () async {
                        //登陆获取信息
                        UserBean user = await model.login(_controller.text);
                        //更新用户信息
                        Provider.of<UserBean>(context, listen: false)
                            .update(user);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => MoviesPage()));
                      },
                      child: Text('登陆'),
                    );
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  '当前登陆用户为: ${Provider.of<UserBean>(context, listen: true).name}')
            ],
          ),
        ),
      ),
    );
  }
}
