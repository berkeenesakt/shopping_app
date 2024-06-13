import 'package:flutter/foundation.dart';
import 'package:shopping_app/core/constants/string_constants.dart';
import 'package:shopping_app/product/models/product_model.dart';

import '../../product/models/cart_item_model.dart';

class CartModel with ChangeNotifier {
  final List<CartItemModel> _items = [];

  List<CartItemModel> get items => _items;

  bool done = false;

  void addToCart(ProductModel product) {
    if (_items.any((element) => element.product == product)) {
      final index = _items.indexWhere((element) => element.product == product);
      _items[index] = CartItemModel(
        product: product,
        quantity: _items[index].quantity + 1,
      );
    } else {
      _items.add(CartItemModel(product: product, quantity: 1));
    }
    notifyListeners();
  }

  void removeFromCart(ProductModel product) {
    if (_items.any((element) => element.product == product)) {
      final index = _items.indexWhere((element) => element.product == product);
      if (_items[index].quantity > 1) {
        _items[index] = CartItemModel(
          product: product,
          quantity: _items[index].quantity - 1,
        );
      } else {
        _items.removeAt(index);
      }
    } else {
      throw Exception(StringConstants.productNotInCart);
    }
    notifyListeners();
  }

  void increaseQuantity(ProductModel product) {
    if (_items.any((element) => element.product == product)) {
      final index = _items.indexWhere((element) => element.product == product);
      if (_items[index].quantity < 99) {
        _items[index] = CartItemModel(
          product: product,
          quantity: _items[index].quantity + 1,
        );
      }
    } else {
      throw Exception(StringConstants.productNotInCart);
    }
    notifyListeners();
  }

  void decreaseQuantity(ProductModel product) {
    if (_items.any((element) => element.product == product)) {
      final index = _items.indexWhere((element) => element.product == product);
      if (_items[index].quantity > 1) {
        _items[index] = CartItemModel(
          product: product,
          quantity: _items[index].quantity - 1,
        );
      } else {
        _items.removeAt(index);
      }
    } else {
      throw Exception(StringConstants.productNotInCart);
    }
    notifyListeners();
  }

  void checkout() {
    _items.clear();
    done = true;
    notifyListeners();
  }

  void doneShopping() {
    done = false;
    notifyListeners();
  }

  double totalPrice() {
    double total = 0;
    for (final item in _items) {
      total += item.product.price * item.quantity;
    }
    return total;
  }
}
