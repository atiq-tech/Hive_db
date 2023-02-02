import 'package:badges/badges.dart';
import 'package:bornon_app/models/allproduct_model.dart';
import 'package:bornon_app/order_summery/order_summery_page.dart';
import 'package:bornon_app/size/size_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ShortDetailsPage extends StatefulWidget {
  ShortDetailsPage({super.key, required this.index});
  int? index;
  @override
  State<ShortDetailsPage> createState() => _ShortDetailsPageState();
}

class _ShortDetailsPageState extends State<ShortDetailsPage> {
  final TextEditingController _imgController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  List<Map<String, dynamic>> _hiveProductlist = [];

  final _testProducthiveBox = Hive.box('testProducthiveBox');

  void _refreshItems() {
    final data = _testProducthiveBox.keys.map((key) {
      final item = _testProducthiveBox.get(key);
      return {
        "keys": key,
        "img": item["img"],
        "name": item["name"],
        "price": item["price"],
        "quantity": item["quantity"],
      };
    }).toList();
    setState(() {
      _hiveProductlist = data.reversed.toList();
      print("aaaaaaaaaaaaaaaaaaaaaaaaa item is=${_hiveProductlist.length}");
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshItems();
  }

  Future<void> _createItem(Map<String, dynamic> newItems) async {
    await _testProducthiveBox.add(newItems);
    _refreshItems();
  }

  Future<void> _deleteItem(int itemkey) async {
    await _testProducthiveBox.delete(itemkey);
    _refreshItems();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color.fromARGB(255, 165, 203, 235),
        content: Text(
          "An item is deleted successfully",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16.0),
        )));
  }

  final productData = AllProductModel.generatedMySourecList();
  final mySize = SizeItems.generatedMySourecList();

  int isPress = 1;
  int quantity = 0;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 204, 241, 240),
      endDrawer: Drawer(
        child: ListView.builder(
            itemCount: _hiveProductlist.length,
            itemBuilder: (context, index) {
              final AllproductindexItem = _hiveProductlist[index];
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
                          width: MediaQuery.of(context).size.width / 8,
                          height: MediaQuery.of(context).size.height / 16,
                          padding: EdgeInsets.only(left: 5.0, right: 5.0),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 196, 3, 202),
                          ),
                          child: Image.asset(
                            "${AllproductindexItem["img"]}",
                            fit: BoxFit.fill,
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${AllproductindexItem["name"]}",
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Price:${AllproductindexItem["price"]}",
                            style: TextStyle(
                                color: Color.fromARGB(255, 46, 51, 51),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Quantity:${AllproductindexItem["quantity"].toString().padLeft(2, "0")}",
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
                                    AllproductindexItem['quantity'] != 0
                                        ? AllproductindexItem['quantity']--
                                        : AllproductindexItem['quantity']++;
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
                                "${AllproductindexItem['quantity'].toString().padLeft(2, "0")}",
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
                                    AllproductindexItem['quantity']++;
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
                                  _deleteItem(AllproductindexItem["keys"]),
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 64, 86, 97),
          leading: InkWell(
            onTap: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Text(
            "Bornon",
            style: GoogleFonts.robotoMono(
                fontStyle: FontStyle.italic,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.white),
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
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                //color: Colors.blue,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                            //color: Color.fromARGB(255, 177, 12, 163),
                            image: DecorationImage(
                                image: AssetImage(
                                    "${productData[widget.index!].img}"),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        //color: Color.fromARGB(255, 247, 99, 234),
                        child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 50,
                                height: 70,
                                margin: EdgeInsets.only(left: 8, right: 8),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "${productData[widget.index!].img}"),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              );
                            },
                            separatorBuilder: (_, index) =>
                                SizedBox(height: 10.0),
                            itemCount: 6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                //color: Color.fromARGB(255, 65, 80, 92),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.0),
                    Row(
                      children: [
                        Text(
                          "${productData[widget.index!].title}",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              quantity != 1 ? quantity-- : quantity++;
                            });
                          },
                          child: Container(
                            width: 18.0,
                            height: 18.0,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.5),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Icon(
                              Icons.remove,
                              size: 14.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "${quantity}",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          child: Container(
                            width: 18.0,
                            height: 18.0,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.5),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Icon(
                              Icons.add,
                              size: 14.0,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Short Details:",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: 1.0,
                      width: 150.0,
                      color: Colors.black,
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      "Shop Online for Original and Imported Baby Lotions & Oils at Best Price in Bangladesh. Easy Return & Refund. Quality and Best Price Guaranteed.",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 30.0),
                    Row(
                      children: [
                        Text(
                          "Price:",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "${productData[widget.index!].price}",
                          style: GoogleFonts.roboto(
                              color: Color.fromARGB(255, 43, 42, 42),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Text(
                          "Category id: ",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "$quantity",
                          style: GoogleFonts.roboto(
                              color: Color.fromARGB(255, 43, 42, 42),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "❤️ Add to wishlist",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Text(
                          "Color:",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Container(
                          height: 20.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30.0)),
                        )
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Text(
                          "Size:",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Container(
                          height: 40.0,
                          width: 180.0,
                          padding: EdgeInsets.all(5.0),
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: mySize.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    isPress = index;
                                  });
                                },
                                child: Container(
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: BoxDecoration(
                                      color: isPress == index
                                          ? Color.fromARGB(255, 223, 13, 94)
                                          : Color.fromARGB(255, 238, 113, 154),
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: Center(
                                    child: Text(
                                      "${mySize[index].T_shirt_size}",
                                      style: GoogleFonts.roboto(
                                          color: isPress == index
                                              ? Colors.white
                                              : Color.fromARGB(
                                                  255, 5, 110, 197),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (_, index) => SizedBox(
                              width: 10.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      "Short Details:Short Details:Short...",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => OrderSummeryPage()));
                              });
                            },
                            child: Container(
                                height: MediaQuery.of(context).size.height / 18,
                                width: MediaQuery.of(context).size.width / 3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      bottomRight: Radius.circular(30.0),
                                    ),
                                    color: Color.fromARGB(255, 24, 125, 240)),
                                child: Center(
                                  child: Text(
                                    "Check out",
                                    style: GoogleFonts.roboto(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                )),
                          ),
                          SizedBox(width: 10.0),
                          Builder(
                            builder: (context) => InkWell(
                              onTap: () {
                                setState(() {
                                  Scaffold.of(context).openEndDrawer();
                                  _createItem({
                                    "img": "${productData[widget.index!].img}",
                                    "name":
                                        "${productData[widget.index!].title}",
                                    "price":
                                        "${productData[widget.index!].price}",
                                    "quantity": 1,
                                  });
                                  _imgController.text = '';
                                  _nameController.text = '';
                                  _priceController.text = '';
                                  _quantityController.text = '';
                                });
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height / 18,
                                width: MediaQuery.of(context).size.width / 3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      bottomRight: Radius.circular(30.0),
                                    ),
                                    color: Color.fromARGB(255, 189, 199, 95)),
                                child: Center(
                                  child: Text(
                                    "Add To Cart",
                                    style: GoogleFonts.roboto(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        fixedColor: Color.fromARGB(255, 3, 107, 46),
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 201, 241, 253),
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits),
            label: "Product",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
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

  int _selectedIndex = 0;
}
