import 'package:flutter/material.dart';
import 'package:myshop_flutter/utils/navigator_util.dart';

class LoadPage extends StatefulWidget {
  @override
  _LoadPageState createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),()=>{
      NavigatorUtil.goShopMainPage(context)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Image.asset(
          "images/loading.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
