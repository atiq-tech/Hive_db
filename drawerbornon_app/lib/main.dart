import 'package:bornon_app/add_to_cart_part/add_to_cart_page.dart';
import 'package:bornon_app/bottomNavigation/bottomnavigationbar_part.dart';
import 'package:bornon_app/category_all_items/care_items.dart';
import 'package:bornon_app/details_section/short_details_page.dart';
import 'package:bornon_app/drawer/drawer_all_items/log_in_page.dart';
import 'package:bornon_app/drawer/drawer_all_items/my_orders_page.dart';
import 'package:bornon_app/drawer/drawer_all_items/sign_up_create_account_page.dart';
import 'package:bornon_app/navallpages/allproduct_page.dart';
import 'package:bornon_app/navallpages/home_page.dart';
import 'package:bornon_app/order_summery/order_summery_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('testhiveBox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: OrderSummeryPage(),
      //home: ShortDetailsPage(),
      //home: AddToCartPage(),
       home: BottomNavigationBarPart(),
      //home: MyOrdersPage(),
      //home: logInPage(),
      //home: SignUpCreateAccountPage(),
      // home: CareItems(),
     // home: AllProductPage(index: index),
    );
  }
}
