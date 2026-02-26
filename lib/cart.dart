import 'package:flutter/material.dart';
import 'package:test/product.dart';

class Cart extends ChangeNotifier{
  final List<CartItem> _cart = [];

  List<CartItem> get items => _cart;

  void add(CartItem item){
    _cart.add(item);
    notifyListeners();
  }

  int get totalQuantity{
    int total = 0;
    _cart.forEach((item)=> total += item.quantity); 
    return total;
  }
}

class CartItem{
  final Product product;
  late int quantity;

  CartItem({
    required this.product,
    this.quantity = 1
  });
}
