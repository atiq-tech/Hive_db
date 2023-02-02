import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:bornon_app/bottomNavigation/bottomnavigationbar_part.dart';
import 'package:bornon_app/carousel/carousel_items.dart';
import 'package:bornon_app/common_section/common_add_cartbtn.dart';
import 'package:bornon_app/drawer/drawer_all_items/log_in_page.dart';
import 'package:bornon_app/drawer/drawer_all_items/my_orders_page.dart';
import 'package:bornon_app/drawer/drawer_items.dart';
import 'package:bornon_app/itemlist/hotdealmodel_product.dart';
import 'package:bornon_app/itemlist/newarrivelmodel_product.dart';
import 'package:bornon_app/itemlist/seeAll/see_all_section.dart';
import 'package:bornon_app/itemlist/itemListPart.dart';
import 'package:bornon_app/models/model_items.dart';
import 'package:bornon_app/navallpages/allproduct_page.dart';
import 'package:bornon_app/navallpages/category_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final TextEditingController _imgController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  final Mydata = ModelItems.generatedMySourecList();
  int quantity = 0;

  List<Map<String, dynamic>> _hiveitemslist = [];

  final _testhiveBox = Hive.box('testhiveBox');

  void _refreshItems() {
    final data = _testhiveBox.keys.map((key) {
      final item = _testhiveBox.get(key);
      return {
        "keys": key,
        "img": item["img"],
        "name": item["name"],
        "price": item["price"],
        "quantity": item["quantity"],
      };
    }).toList();
    setState(() {
      _hiveitemslist = data.reversed.toList();
      print("aaaaaaaaaaaaaaaaaaaaaaaaa item is=${_hiveitemslist.length}");
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshItems();
  }

  Future<void> _createItem(Map<String, dynamic> newItems) async {
    await _testhiveBox.add(newItems);
    _refreshItems();
  }

  Future<void> _deleteItem(int itemkey) async {
    await _testhiveBox.delete(itemkey);
    _refreshItems();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color.fromARGB(255, 165, 203, 235),
        content: Text(
          "An item is deleted successfully",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16.0),
        )));
  }

  // void _showFormDetails(BuildContext ctx, int? itemKey) async {
  //   if (itemKey != null) {
  //     final exitItem =
  //         _hiveitemslist.firstWhere((element) => element['keys'] == itemKey);
  //     _imgController.text = exitItem['img'];
  //     _nameController.text = exitItem['name'];
  //     _priceController.text = exitItem['price'];
  //     _quantityController.text = exitItem['quantity'];
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 130.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 78, 106, 124),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw8tnmRAobUlTWwXTzG0yJevfymCAQw00wZw&usqp=CAU'),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your name',
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Enter your phone',
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BottomNavigationBarPart()));
                });
              },
              child: DrawerItems(
                icon: Icons.home,
                text: 'HOME',
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CategoryPage()));
                });
              },
              child: DrawerItems(
                icon: Icons.category,
                text: 'CATEGORIES',
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AllProductPage(
                            index: index,
                          )));
                });
              },
              child: DrawerItems(
                icon: Icons.shopping_cart,
                text: 'SHOP',
              ),
            ),
            DrawerItems(
              icon: Icons.person_add_rounded,
              text: 'MY ACCOUNT',
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyOrdersPage()));
                });
              },
              child: DrawerItems(
                icon: Icons.lock_clock_sharp,
                text: 'MY ORDERS',
              ),
            ),
            DrawerItems(
              icon: Icons.favorite,
              text: 'MY FAVORITES',
            ),
            DrawerItems(
              icon: Icons.file_copy_sharp,
              text: 'INTRO',
            ),
            DrawerItems(
              icon: Icons.newspaper,
              text: 'NEWS',
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => logInPage()));
                });
              },
              child: DrawerItems(
                icon: Icons.login,
                text: 'LOG OUT',
              ),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView.builder(
            itemCount: _hiveitemslist.length,
            itemBuilder: (context, index) {
              final storeAllindexItem = _hiveitemslist[index];
              return Container(
                child: Card(
                  elevation: 5,
                  color: Color.fromARGB(255, 83, 117, 190),
                  margin: EdgeInsets.all(10.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 8,
                            height: MediaQuery.of(context).size.height / 16,
                            padding: EdgeInsets.only(left: 5.0, right: 5.0),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 196, 3, 202),
                            ),
                            child: Image.asset(
                              "${storeAllindexItem["img"]}",
                              fit: BoxFit.fill,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${storeAllindexItem["name"]}",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Price:${storeAllindexItem["price"]}",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 46, 51, 51),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Quantity:${storeAllindexItem["quantity"].toString().padLeft(2, "0")}",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      storeAllindexItem['quantity'] != 0
                                          ? storeAllindexItem['quantity']--
                                          : storeAllindexItem['quantity']++;
                                    });
                                  },
                                  child: Container(
                                    width: 25.0,
                                    height: 25.0,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 66, 91, 117),
                                        borderRadius:
                                            BorderRadius.circular(50.0)),
                                    child: Icon(
                                      Icons.remove,
                                      color: Color.fromARGB(255, 212, 209, 209),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  "${storeAllindexItem['quantity'].toString().padLeft(2, "0")}",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 28, 28, 29),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      storeAllindexItem['quantity']++;
                                    });
                                  },
                                  child: Container(
                                    width: 25.0,
                                    height: 25.0,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 66, 91, 117),
                                        borderRadius:
                                            BorderRadius.circular(50.0)),
                                    child: Icon(
                                      Icons.add,
                                      color: Color.fromARGB(255, 212, 209, 209),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 25.0,
                              height: 25.0,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 66, 91, 117),
                                  borderRadius: BorderRadius.circular(4.0)),
                              child: InkWell(
                                onTap: () =>
                                    _deleteItem(storeAllindexItem["keys"]),
                                child: Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 212, 209, 209),
                                  size: 20.0,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          backgroundColor: Color.fromARGB(235, 89, 98, 121),
          leading: Builder(
            builder: (context) => IconButton(
              icon: Center(
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
          title: Text("Bornon"),
          actions: [
            Icon(
              Icons.search,
              color: Colors.white,
            ),
            SizedBox(
              width: 10.0,
            ),
            Icon(
              Icons.person_outline_rounded,
              color: Colors.white,
            ),
            SizedBox(
              width: 10.0,
            ),
            Builder(
              builder: (context) => IconButton(
                icon: Center(
                  child: Badge(
                      badgeColor: Color.fromARGB(255, 214, 30, 6),
                      animationDuration: Duration(milliseconds: 300),
                      badgeContent: Text(
                        "0",
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      ),
                      child: Icon(Icons.shopping_cart_checkout_outlined)),
                ),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselItems(),
            SizedBox(height: 15.0),
            ItemListPart(Mydata: Mydata),
            SizedBox(height: 15.0),
            SeeAllSection(
              seetitleText: "Hot Deal",
              seeAllText: "See All",
            ),
            SizedBox(height: 10.0),
            InkWell(
                // onTap: () {
                //   setState(() {
                //     quantity++;
                //     // _showFormDetails(context, null);
                //   });
                // },

                child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Container(
                height: 200.0,
                width: double.infinity,
                //color: Colors.green,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          _createItem({
                            "img": "${Mydata[index].img}",
                            "name": "${Mydata[index].title}",
                            "price": "${Mydata[index].price}",
                            "quantity": 1,
                          });
                          _imgController.text = '';
                          _nameController.text = '';
                          _priceController.text = '';
                          _quantityController.text = '';
                        },
                        child: Container(
                          width: 110.0,
                          color: Color.fromARGB(255, 255, 255, 255),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "${Mydata[index].img}"),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  // color: Color.fromARGB(255, 145, 11, 122),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 20.0),
                                      Text(
                                        "${Mydata[index].title}",
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 31, 30, 30),
                                            fontSize: 12.0),
                                      ),
                                      SizedBox(height: 5.0),
                                      Text(
                                        "${Mydata[index].price}",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 8, 117, 241),
                                            fontSize: 14.0),
                                      ),
                                      SizedBox(height: 10.0),
                                      CommonAddCartBtn(),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, index) => SizedBox(width: 15.0),
                    itemCount: Mydata.length),
              ),
            )),
            SizedBox(height: 15.0),
            SeeAllSection(
              seetitleText: "New Arrivel",
              seeAllText: "See All",
            ),
            SizedBox(height: 10.0),
            NewArrivelModelProduct(Mydata: Mydata),
            SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Text(
                "All Product",
                style: TextStyle(
                    fontSize: 18.0,
                    backgroundColor: Color.fromARGB(255, 152, 182, 97),
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: Mydata.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 15.0,
                      crossAxisSpacing: 15.0,
                      childAspectRatio: 5 / 7),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 110.0,
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(3.0),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 3.0,
                              blurRadius: 10.0,
                              color: Color.fromARGB(255, 231, 227, 227),
                              offset: Offset(3.0, 3.0)),
                        ],
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(3.0),
                                      topRight: Radius.circular(3.0)),
                                  image: DecorationImage(
                                      image: AssetImage("${Mydata[index].img}"),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              // color: Color.fromARGB(255, 145, 11, 122),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20.0),
                                  Text(
                                    "${Mydata[index].title}",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 31, 30, 30),
                                        fontSize: 12.0),
                                  ),
                                  SizedBox(height: 5.0),
                                  Text(
                                    "${Mydata[index].price}",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 8, 117, 241),
                                        fontSize: 14.0),
                                  ),
                                  SizedBox(height: 10.0),
                                  CommonAddCartBtn(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
