import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeTOPsellPage extends StatefulWidget {
  const HomeTOPsellPage({super.key});

  @override
  State<HomeTOPsellPage> createState() => _HomeTOPsellPageState();
}

class _HomeTOPsellPageState extends State<HomeTOPsellPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 7, 223, 212),
        child: Center(child: Text("Top Sell pages")),
      ),
    );
  }
}
