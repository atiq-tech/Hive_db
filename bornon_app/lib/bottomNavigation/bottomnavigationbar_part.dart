import 'package:bornon_app/add_to_cart_part/add_to_cart_page.dart';
import 'package:bornon_app/models/hive_model_products.dart';
import 'package:bornon_app/navallpages/home_cartview_item_page.dart';
import 'package:bornon_app/navallpages/home_page.dart';
import 'package:bornon_app/navallpages/home_product_page.dart';
import 'package:bornon_app/navallpages/home_top_sell_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomNavigationBarPart extends StatefulWidget {
  const BottomNavigationBarPart({super.key});

  @override
  State<BottomNavigationBarPart> createState() =>
      _BottomNavigationBarPartState();
}

class _BottomNavigationBarPartState extends State<BottomNavigationBarPart> {
  int _selectedIndex = 0;

  final _ListPages = [
    HomePage(),
    HomeCartViewItemPage(),
    //HomeProductPage(),
    //HomeTOPsellPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _ListPages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        fixedColor: Color.fromARGB(255, 3, 107, 46),
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 201, 241, 253),
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits),
            label: "Product",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "Menu",
          ),
        ],
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
