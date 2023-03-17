import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = [
    // [itemName, itemPrice, imagePath, color]
    ["Avocado", "40.00", "lib/images/avocado.png", Colors.green],
    ["Banana", "12.00", "lib/images/banana.png", Colors.yellow],
    ["Chicken", "120.00", "lib/images/chicken.png", Colors.brown],
    ["Water Bottle", "20.00", "lib/images/water.png", Colors.blue],
    ["Cabbage", "40.00", "lib/images/cabbage.png", Colors.lightGreen],
    ["Spinach", "45.00", "lib/images/spinach.png", Colors.green],
    ["Carrot", "50.00", "lib/images/carrot.png", Colors.orange],
    ["Eggplant", "55.00", "lib/images/eggplant.png", Colors.purple],
    ["Pea", "30.00", "lib/images/pea.png", Colors.lightGreen],
    ["Onion", "30.00", "lib/images/onion.png", Colors.pink],
    ["Potato", "20.00", "lib/images/potato.png", Colors.brown],
    ["Tomato", "25.00", "lib/images/tomato.png", Colors.red],
    ["Cauliflower", "30.00", "lib/images/cauliflower.png", Colors.lightGreen],
    ["Yellow Pepper", "70.00", "lib/images/yellow-pepper.png", Colors.yellow],
    ["Radish", "60.00", "lib/images/radish.png", Colors.pink],
    ["Grapes", "80.00", "lib/images/grapes.png", Colors.purple], 
    ["Bell Pepper", "50.00", "lib/images/bell-pepper.png", Colors.green],
    ["Broccoli", "80.00", "lib/images/broccoli.png", Colors.lightGreen],
  ];

  // list of cart items
  final List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  // add items to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove items form cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;

    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
