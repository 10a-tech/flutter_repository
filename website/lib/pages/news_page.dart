import 'package:flutter/material.dart';
import 'package:website/model/news_entity.dart';
import 'package:website/pages/new_detail_page.dart';
import 'package:website/services/news.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  NewsEntity datas = NewsEntity();

  void getNewsList() async {
    var data = await getNewsResult();
    NewsEntity newsEntity = NewsEntity().fromJson(data);
    setState(() {
      if (datas.items == null) {
        datas.items = List<NewsItem>();
      }
      datas.items.addAll(newsEntity.items);
    });
  }

  @override
  void initState() {
    getNewsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        separatorBuilder: (BuildContext context, int index) => Divider(
          height: 1.0,
        ),
        itemCount: datas.items ==null ? 0 : datas.items.length,
        itemBuilder: (BuildContext context, int index){
          NewsItem item = datas.items[index];
          return ListTile(
            title: Text(item.title),
            subtitle: Text(item.content),
            leading: Icon(Icons.fiber_new),
            trailing: Icon(Icons.arrow_forward),
            contentPadding: EdgeInsets.all(10.0),
            enabled: true,
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewsDetailPage(
                        item: item,
                      )));
            },
          );
        },
      ),
    );
  }
}
