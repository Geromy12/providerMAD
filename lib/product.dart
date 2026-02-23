import 'package:flutter/material.dart';

class Product {
  final int id;
  late String name;
  late String description;
  late double price;
  bool isFave;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.isFave = false
  });
}

class Products extends ChangeNotifier{
  final List<Product> _products = [
    Product(id: 1, name: "Iphone 17", description: "iphone", price: 60000),
    Product(id: 2, name: "Samsung Ultra", description: "samsung", price: 56000),
    Product(id: 3, name: "Oppo 123", description: "oppo", price: 25000)
  ];

  //get
  List<Product> get items => _products;

  void add(Product p){
    items.add(p);
    notifyListeners();
  }

  void update(Product p){
    p.isFave = !p.isFave;
    notifyListeners();
  }

  void toggleID(int id){
   var data = _products.firstWhere((e)=> e.id == id);
   data.isFave = !data.isFave;
   notifyListeners();
  }
}
