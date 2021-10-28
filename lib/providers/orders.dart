import 'package:flutter/cupertino.dart';
import 'package:flutter_complete_guide/providers/cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final DateTime date;
  final List<CartItem> products;

  OrderItem({
    required this.id,
    required this.amount,
    required this.date,
    required this.products,
  });
}

class Orders with ChangeNotifier {
  final List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        date: DateTime.now(),
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
