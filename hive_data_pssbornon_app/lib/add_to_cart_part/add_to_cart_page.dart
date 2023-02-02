import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddToCartPage extends StatefulWidget {
  const AddToCartPage({super.key});

  @override
  State<AddToCartPage> createState() => _AddToCartPageState();
}

class _AddToCartPageState extends State<AddToCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 4, 138, 156),
          title: Text("Category"),
          centerTitle: true,
        ),
      ),
      body: ListView(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.only(top: 30.0),
              child: Image.asset(
                "images/motor.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 70.0,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Image.asset("images/motor5.jpg"),
                    SizedBox(width: 20),
                    Image.asset("images/motor3.jpg"),
                    SizedBox(width: 20),
                    Image.asset("images/motor2.jpg"),
                    SizedBox(width: 20),
                    Image.asset("images/motor4.jpg"),
                    Image.asset("images/motor.jpg"),
                    Image.asset("images/motor1.jpg"),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    "Men Polo T-shirt",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Price:৳240.00",
                    style: TextStyle(
                        color: Color.fromARGB(255, 104, 101, 101),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "🤍Add To Wishlist",
                    style: TextStyle(
                        color: Color.fromARGB(255, 104, 101, 101),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "Category:",
                        style: TextStyle(
                            color: Color.fromARGB(255, 104, 101, 101),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Men",
                        style: TextStyle(
                            color: Color.fromARGB(255, 39, 132, 253),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "Color:",
                        style: TextStyle(
                            color: Color.fromARGB(255, 104, 101, 101),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ),
                      Container(
                        width: 50.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 0, 0, 0),
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "Size:",
                        style: TextStyle(
                            color: Color.fromARGB(255, 104, 101, 101),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ),
                      Container(
                        width: 50.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 202, 16, 3),
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Center(
                          child: Text(
                            "s",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "On the night of 31 December and the morning of 1 January, people in many countries all over the world will celebrate the beginning of a new year. How will they celebrate and how did this tradition begin?",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Color.fromARGB(255, 48, 46, 46),
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text("Quantity:  1"),
                      Icon(Icons.arrow_drop_down),
                      Text(
                        "For Bulk Quantity",
                        style: TextStyle(color: Color.fromARGB(255, 252, 3, 3)),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Stock: Available",
                    style: TextStyle(
                        color: Color.fromARGB(255, 104, 101, 101),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 18,
                        width: MediaQuery.of(context).size.width / 4,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 158, 231, 74)),
                        child: Center(
                          child: Text(
                            "Add to cart",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: MediaQuery.of(context).size.height / 18,
                        width: MediaQuery.of(context).size.width / 4,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 253, 21, 118)),
                        child: Center(
                          child: Text(
                            "Checkout",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: Color.fromARGB(255, 3, 119, 9),
        currentIndex: _currentindex,
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
            _currentindex = value;
          });
        },
      ),
    );
  }

  int _currentindex = 1;
  // final _ListPages = [
  //   Text("Product"),
  //   Text("CheckOut"),
  //   Text("Menu Bar"),
  // ];
}
