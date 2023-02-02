import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllProductModel {
  String img;
  String title;
  String discount;
  String price;
  String size;
  AllProductModel(
    this.img,
    this.title,
    this.discount,
    this.price,
    this.size,
  );
  static List<AllProductModel> generatedMySourecList() {
    return [
      AllProductModel(
        "assets/blsn.jpg",
        "Baby Lotion",
        "25%",
        "\৳ 2000",
        "S",
      ),
      AllProductModel(
        "assets/motornew.jpg",
        "Motor Engine",
        "25%",
        "\৳ 2450",
        "M",
      ),
      AllProductModel(
        "assets/ptshirt.jpg",
        "Men Polo T-shirt",
        "25%",
        "\৳ 240",
        "XL",
      ),
      AllProductModel(
        "assets/psharee.jpg",
        "Sporsia Campos",
        "25%",
        "\৳ 2344",
        "XXL",
      ),
      AllProductModel(
        "assets/psharee1.jpg",
        "Sophia Campos",
        "25%",
        "\৳ 2000",
        "",
      ),
      AllProductModel(
        "assets/test2.jpg",
        "test 2",
        "25%",
        "\৳ 235",
        "",
      ),
      AllProductModel(
        "assets/hearlds.jpg",
        "Test Similar product",
        "25%",
        "\৳ 234",
        "",
      ),
      AllProductModel(
        "assets/panjabi.jpg",
        "Desirae Paul",
        "25%",
        "\৳ 940",
        "",
      ),
      AllProductModel(
        "assets/babycute.jpg",
        "Quentin Mccormick",
        "25%",
        "\৳ 920",
        "",
      ),
      AllProductModel(
        "assets/uma.jpg",
        "Uma Lucas",
        "25%",
        "\৳ 261",
         "",
      ),
      AllProductModel(
        "assets/raya.jpg",
        "Raya Melendez",
        "25%",
        "\৳602",
         "",
      ),
      AllProductModel(
        "assets/aline.jpg",
        "Aline Garrett",
        "25%",
        "\৳ 782",
         "",
      ),
      AllProductModel(
        "assets/shirt.jpg",
        "Shirt",
        "25%",
        "\৳ 22445",
         "",
      ),
      AllProductModel(
        "assets/mejia.jpeg",
        "MacKensie Mejia",
        "25%",
        "\৳ 918",
         "",
      ),
      AllProductModel(
        "assets/test.jpg",
        "test product",
        "25%",
        "\৳ 3434",
         "",
      ),
      AllProductModel(
        "assets/wilcox.jpeg",
        "Chandler Wilcox",
        "25%",
        "\৳ 266",
         "",
      ),
      AllProductModel(
        "assets/ashely.jpg",
        "Ashely Macias",
        "25%",
        "\৳ 511",
         "",
      ),
    ];
  }
}
