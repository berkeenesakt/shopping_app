import 'package:flutter/material.dart';

import '../../../feature/cart/cart_model.dart';
import '../../models/cart_item_model.dart';
import '../../models/product_model.dart';

class CartItemQuantity extends StatelessWidget {
  const CartItemQuantity({
    super.key,
    required this.cart,
    required this.cartModel,
    required this.product,
  });

  final CartItemModel cart;
  final CartModel cartModel;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: cart.quantity == 1
              ? const Icon(Icons.delete_outline_rounded)
              : const Icon(Icons.remove),
          onPressed: () {
            cartModel.decreaseQuantity(product);
          },
        ),
        SizedBox(
          width: 24,
          child: Center(
            child: Text(
              '${cart.quantity}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            cartModel.increaseQuantity(product);
          },
        ),
      ],
    );
  }
}
