import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeCartViewItemPage extends StatefulWidget {
  const HomeCartViewItemPage({super.key});

  @override
  State<HomeCartViewItemPage> createState() => _HomeCartViewItemPageState();
}

class _HomeCartViewItemPageState extends State<HomeCartViewItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
      color: Colors.red,
      child: Center(child: Text("Cart pages")),
    ),
    );
   
  }
}
