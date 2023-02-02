import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class CareItems extends StatefulWidget {
  const CareItems({super.key});

  @override
  State<CareItems> createState() => _CareItemsState();
}

class _CareItemsState extends State<CareItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: PreferredSize(
         preferredSize: Size.fromHeight(45.0),
        child: AppBar(
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
            "Care",
            style: GoogleFonts.robotoMono(
                fontSize: 18.0, fontWeight: FontWeight.w300),
          ),
          actions: [
            Center(
              child: Badge(
                  badgeColor: Color.fromARGB(255, 214, 30, 6),
                  animationDuration: Duration(milliseconds: 300),
                  badgeContent: Text(
                    "0",
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                  child: Icon(Icons.shopping_cart_sharp)),
            ),
            SizedBox(
              width: 15.0,
            )
          ],
        ),
      ),
    );
  }
}
