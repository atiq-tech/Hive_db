import 'package:hive_flutter/adapters.dart';

@HiveType(typeId: 1)
class Product extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? image;
  @HiveField(2)
  int? price;
  @HiveField(3)
  String? description;
  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });
}

List<Product> products = [
  Product(
      name: 'Apple',
      image: 'fruits/apple.png',
      price: 13,
      description: 'Apple is very good fruits'
     ),
  Product(
      name: 'Avocado',
      image: 'fruits/avocado.png',
      price: 15,
     description: 'Apple is very good fruits'),
  Product(
      name: 'Banana',
      image: 'fruits/banana.png',
      price: 11,
     description: 'Apple is very good fruits'),
  Product(
      name: 'Beet',
      image: 'fruits/beet.png',
      price: 16,
      description: 'Apple is very good fruits'),
  Product(
      name: 'Blackberries',
      image: 'fruits/blackberries.png',
      price: 17,
      description: 'Apple is very good fruits'),
  Product(
      name: 'Chery',
      image: 'fruits/cherries.png',
      price: 14,
     description: 'Apple is very good fruits'),
  Product(
      name: 'Grape',
      image: 'fruits/grape.png',
      price: 13,
      description: 'Apple is very good fruits'),
  Product(
      name: 'Guava',
      image: 'fruits/guava.png',
      price: 17,
      description: 'Apple is very good fruits'),
  Product(
      name: 'Carrot',
      image: 'vegetables/carrot.png',
      price: 4,
      description: 'Apple is very good fruits'),
  Product(
      name: 'Celery',
      image: 'vegetables/celery.png',
      price: 7,
      description: 'Apple is very good fruits'),
  Product(
      name: 'Corn',
      image: 'vegetables/corn.png',
      price: 11,
      description: 'Apple is very good fruits'),
  Product(
      name: 'Eggplant',
      image: 'vegetables/eggplant.png',
      price: 9,
      description: 'Apple is very good fruits'),
  Product(
      name: 'Green Pea',
      image: 'vegetables/greenpeas.png',
      price: 8,
      description: 'Apple is very good fruits'),
  Product(
      name: 'Lettuce',
      image: 'vegetables/lettuce.png',
      price: 17,
      description: 'Apple is very good fruits'),
  Product(
      name: 'Potato',
      image: 'vegetables/potato.png',
      price: 7,
      description: 'Apple is very good fruits'),
  Product(
      name: 'Zucchini',
      image: 'vegetables/zucchini.png',
      price: 8,
      description: 'Apple is very good fruits'),
];
