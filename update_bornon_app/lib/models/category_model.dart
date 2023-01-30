import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  String img;
  String title;
  String discount;

  CategoryModel(
    this.img,
    this.title,
    this.discount,
   
  );
  static List<CategoryModel> generatedMySourecList() {
    return [
      CategoryModel(
        "assets/care.jpg",
        "Care",
        "25%",      
      ),
      CategoryModel(
        "assets/kids.webp",
        "Kids",
        "25%",        
      ),
      CategoryModel(
        "assets/wmen.webp",
        "Women",
        "25%", 
      ),
      CategoryModel(
        "assets/men.jpg",
        "men",
        "25%", 
      ),
      CategoryModel(
        "assets/na.jpg",
        "New Arrival",
        "25%",
      ),
      CategoryModel(
        "assets/trndn.jpg",
        "Tranding",
        "25%",
      ),
    ];
  }
}
