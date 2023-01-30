import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:bornon_app/details_section/short_details_page.dart';
import 'package:bornon_app/models/allproduct_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AllProductPage extends StatefulWidget {
  AllProductPage({
    super.key,
  });

  @override
  State<AllProductPage> createState() => _AllProductPageState();
}

class _AllProductPageState extends State<AllProductPage> {
  final allproduct = AllProductModel.generatedMySourecList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(),
      backgroundColor: Color.fromARGB(255, 151, 185, 236),
      appBar: AppBar(
        elevation: 3.0,
        centerTitle: true,
        leading: Icon(Icons.menu),
        title: Text(
          "All Product",
          style: TextStyle(
              fontStyle: FontStyle.italic, fontSize: 20.0, color: Colors.white),
        ),
        actions: [
          Icon(
            Icons.search,
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
            itemCount: allproduct.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
                childAspectRatio: 5 / 7),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ShortDetailsPage(
                            index: index,
                          )));
                },
                child: Container(
                  decoration: new BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                          color: Color.fromARGB(255, 137, 181, 250),
                          spreadRadius: 5,
                          blurRadius: 5.0,
                          offset: Offset(0.0, 0.1)),
                    ],
                  ),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, left: 5.0, right: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 8,
                            child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromARGB(
                                              255, 173, 171, 171),
                                          spreadRadius: 0.10,
                                          blurRadius: 0.0,
                                          offset: Offset(0.0, 0.1))
                                    ],
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "${allproduct[index].img}"),
                                        fit: BoxFit.fill)),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 0.0,
                                      right: 0.0,
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Color.fromARGB(255, 248, 69, 56),
                                        radius: 18.0,
                                        child: Text(
                                          "${allproduct[index].discount}",
                                          style: TextStyle(fontSize: 15.0),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              //color: Color.fromARGB(255, 235, 209, 209),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10.0),
                                  Text(
                                    "${allproduct[index].title}",
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                  SizedBox(height: 5.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${allproduct[index].price}",
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.black,
                                        size: 12.0,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
