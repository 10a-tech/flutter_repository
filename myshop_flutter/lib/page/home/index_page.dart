import 'package:flutter/material.dart';
import 'package:myshop_flutter/config/index.dart';
import 'package:myshop_flutter/page/cart/cart_page.dart';
import 'package:myshop_flutter/page/category/category_page.dart';
import 'package:myshop_flutter/page/home/home_page.dart';
import 'package:myshop_flutter/page/mine/mine_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _selectedIndex = 0;
  List<Widget> _list = List();

  @override
  void initState() {
    super.initState();
    _list
      ..add(HomePage())
      ..add(CategoryPage())
      ..add(CartPage())
      ..add(MinePage());
  }

  void _onTabPageChange(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _list,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: KColor.indexTabSelectedColor,
        unselectedItemColor: KColor.indexTabUnSelectedColor,
        onTap: _onTabPageChange,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            title: Text(KString.HOME)
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.category),
              title: Text(KString.CATEGORY)
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.shopping_cart),
              title: Text(KString.SHOP_CAR)
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.people),
              title: Text(KString.MINE)
          )
        ],
      ),
    );
  }
}
