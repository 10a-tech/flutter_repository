import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:website/pages/about_content_page.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/company.jpg',
              fit: BoxFit.cover,
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('公司介绍'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('company_info');
              },
            ),
            Divider(
              height: 10.0,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('公司优势'),
            ),
            Divider(
              height: 10.0,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('联系我们'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutContentPage()));
              },
            ),
            Divider(
              height: 10.0,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
