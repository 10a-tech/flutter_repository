import 'package:flutter/material.dart';
import './common/touch_callback.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  FocusNode focusNode = FocusNode();

  _requestFocus() {
    FocusScope.of(context).requestFocus(focusNode);
    return focusNode;
  }

  _getText(String text) {
    return TouchCallback(
      isfeed: false,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xff1aad19),
        ),
      ),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                TouchCallback(
                  isfeed: false,
                  child: Container(
                    height: 45.0,
                    margin: EdgeInsets.only(left: 12.0, right: 10.0),
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 45.0,
                  margin: EdgeInsets.only(left: 50.0, right: 10.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.green,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                          focusNode: _requestFocus(),
                          onChanged: (text) {},
                          decoration: InputDecoration(
                            hintText: '搜索',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.mic,
                          color: Color(0xffaaaaaa),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 50.0),
              child: Text(
                '搜索指定文章',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color(0xffb5b5b5),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _getText('朋友圈'),
                  _getText('文章'),
                  _getText('公众号'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 30.0,
                right: 30.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _getText('小程序'),
                  _getText('音乐'),
                  _getText('表情'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
