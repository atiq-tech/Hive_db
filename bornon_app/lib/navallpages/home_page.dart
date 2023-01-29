import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:bornon_app/carousel/carousel_items.dart';
import 'package:bornon_app/common_section/common_add_cartbtn.dart';
import 'package:bornon_app/itemlist/hotdealmodel_product.dart';
import 'package:bornon_app/itemlist/newarrivelmodel_product.dart';
import 'package:bornon_app/itemlist/seeAll/see_all_section.dart';
import 'package:bornon_app/itemlist/itemListPart.dart';
import 'package:bornon_app/models/model_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _imgController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  final Mydata = ModelItems.generatedMySourecList();
  static int quantity = 0;

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

  void _showFormDetails(BuildContext ctx, int? itemKey) async {
    if (itemKey != null) {
      final exitItem =
          _hiveitemslist.firstWhere((element) => element['keys'] == itemKey);
      _imgController.text = exitItem['img'];
      _nameController.text = exitItem['name'];
      _priceController.text = exitItem['price'];
      _quantityController.text = exitItem['quantity'];
    }

    showModalBottomSheet(
        elevation: 5,
        isScrollControlled: true,
        context: ctx,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(ctx).viewInsets.bottom,
                  left: 15.0,
                  right: 15.0,
                  top: 15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: _imgController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(hintText: 'Enter img'),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(hintText: 'Enter any name'),
                  ),
                  TextField(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    decoration:
                        InputDecoration(hintText: ' Plz Enter the price'),
                  ),
                  SizedBox(height: 15.0),
                  ElevatedButton(
                    onPressed: () async {
                      if (itemKey == null) {
                        _createItem({
                          "img": _imgController.text,
                          "name": _nameController.text,
                          "price": _priceController.text,
                          "quantity": 1,
                        });
                      }
                      _imgController.text = '';
                      _nameController.text = '';
                      _priceController.text = '';
                      _quantityController.text = '';

                      Navigator.of(context).pop();
                    },
                    child: Text("Submit"),
                  )
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView.builder(
            itemCount: _hiveitemslist.length,
            itemBuilder: (context, index) {
              final storeAllindexItem = _hiveitemslist[index];
              return Card(
                elevation: 5,
                color: Color.fromARGB(255, 83, 117, 190),
                margin: EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 6,
                        height: MediaQuery.of(context).size.height / 12,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 196, 3, 202),
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Center(
                          child: Text("${storeAllindexItem["img"]}"),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name:${storeAllindexItem["name"]}",
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Price:${storeAllindexItem["price"]}",
                            style: TextStyle(
                                color: Color.fromARGB(255, 68, 67, 67),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Quantity:${storeAllindexItem["quantity"].toString().padLeft(2, "0")}",
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600),
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
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(236, 46, 48, 53),
        leading: Icon(
          Icons.menu,
          color: Colors.white,
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
                      "$quantity",
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
