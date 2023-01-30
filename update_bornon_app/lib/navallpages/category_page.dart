import 'package:badges/badges.dart';
import 'package:bornon_app/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final categoryProduct = CategoryModel.generatedMySourecList();
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
      body: GridView.builder(
          itemCount: categoryProduct.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              childAspectRatio: 5 / 7),
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
                child: Column(
                  children: [
                    Expanded(
                        flex: 5,
                        child: Container(
                          //padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 173, 171, 171),
                                  spreadRadius: 0.10,
                                  blurRadius: 0.0,
                                  offset: Offset(0.0, 0.1))
                            ],
                          ),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0),
                                  boxShadow: const [
                                    BoxShadow(
                                        color:
                                            Color.fromARGB(255, 173, 171, 171),
                                        spreadRadius: 0.10,
                                        blurRadius: 0.0,
                                        offset: Offset(0.0, 0.1))
                                  ],
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "${categoryProduct[index].img}"),
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
                                        "${categoryProduct[index].discount}",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                          //color: Color.fromARGB(255, 2, 24, 43),
                          child: Center(
                            child: Text(
                              "${categoryProduct[index].title}",
                              style: GoogleFonts.robotoSlab(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
