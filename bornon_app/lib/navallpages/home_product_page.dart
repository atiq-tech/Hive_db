import 'dart:ui';

import 'package:bornon_app/models/hive_model_products.dart';
import 'package:flutter/material.dart';

class HomeProductPage extends StatelessWidget {
  final Product product;
  const HomeProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: 180,
      decoration:
          BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            width: 180,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 8),
                      spreadRadius: 0,
                      blurRadius: 5,
                      color: Colors.brown)
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
            
                child: Image.asset(
                  'assets/${product.image}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              product.name!,
              style: TextStyle(
                  fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
