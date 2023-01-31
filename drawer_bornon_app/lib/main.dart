import 'package:bornon_app/add_to_cart_part/add_to_cart_page.dart';
import 'package:bornon_app/bottomNavigation/bottomnavigationbar_part.dart';
import 'package:bornon_app/details_section/short_details_page.dart';
import 'package:bornon_app/navallpages/home_page.dart';
import 'package:bornon_app/order_summery/order_summery_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('testhiveBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
    );
  }
}
