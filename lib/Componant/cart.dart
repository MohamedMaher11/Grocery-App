import 'package:flutter/material.dart';

class Cartmodel extends ChangeNotifier {
  final List _shopItems = [
    ["Appel", "4.00", "assets/apple.png", Colors.green],
    ["Banana", "8.00", "assets/bananas.png", Colors.yellow],
    ["Guava", "24.00", "assets/guava.png", Colors.brown],
    ["Mango", "10.00", "assets/mango.png", Colors.blue]
  ];
  List _cartItems = [];
  get shopitem => _shopItems;
  get CartItem => _cartItems;
  void create_cart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void delete_cart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculatetotal() {
    double totalprice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalprice += double.parse(_cartItems[i][1]);
    }
    return totalprice.toStringAsFixed(2);
  }
}
