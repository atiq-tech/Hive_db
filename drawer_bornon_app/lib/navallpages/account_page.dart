import 'package:bornon_app/bottomNavigation/bottomnavigationbar_part.dart';
import 'package:bornon_app/navallpages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BottomNavigationBarPart()));
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          Row(
            children: [
              Text(
                "Clear all",
                style: GoogleFonts.robotoSlab(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              Icon(
                Icons.delete,
                color: Colors.white,
              )
            ],
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 6,
              child: Container(
                  //color: Colors.black,
                  )),
          Expanded(
              flex: 1,
              child: Container(
                //color: Colors.black,
                child: Column(
                  children: [
                    Text(
                      "Total:\$0.0",
                      style: GoogleFonts.roboto(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(height: 15.0),
                    Container(
                        height: MediaQuery.of(context).size.height / 22,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.0),
                            border: Border.all(
                                color: Color.fromARGB(255, 201, 207, 157),
                                width: 2),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0.0, 1.0),
                                color: Color.fromARGB(255, 201, 207, 157),
                                blurRadius: 1.0,
                                spreadRadius: 2.0,
                              )
                            ],
                            color: Color.fromARGB(255, 204, 209, 162)),
                        child: Center(
                          child: Text(
                            "Place Order",
                            style: GoogleFonts.roboto(
                                fontStyle: FontStyle.italic,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        )),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
