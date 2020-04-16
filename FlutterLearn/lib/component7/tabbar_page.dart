import 'package:flutter/material.dart';

class TabBarPage extends StatefulWidget {
  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar'),
        bottom: TabBar(
            controller: _tabController,
            //是否可以滚动
            isScrollable: true,
            //选项卡
            tabs: <Widget>[
              Tab(text: '关注',icon: Icon(Icons.shopping_cart),),
              Tab(text: '推荐',icon: Icon(Icons.ac_unit),),
              Tab(text: '抗击肺炎',icon: Icon(Icons.brightness_medium),),
              Tab(text: '热点',icon: Icon(Icons.restaurant),),
              Tab(text: '北京',icon: Icon(Icons.event),),
              Tab(text: '精品课',icon: Icon(Icons.account_balance),),
              Tab(text: '生活',icon: Icon(Icons.alternate_email),),
            ]),
      ),
      body: TabBarView(controller: _tabController, children: <Widget>[
        Text('关注'),
        Text('推荐'),
        Text('抗击肺炎'),
        Text('热点'),
        Text('北京'),
        Text('精品课'),
        Text('生活'),
      ]),
    );
  }
}
