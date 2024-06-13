import 'package:flutter/material.dart';
import 'package:shopping_app/core/extensions/price_parse_extension.dart';

import '../../../core/constants/string_constants.dart';
import '../../../feature/cart/cart_model.dart';
import '../global/button.dart';

class CheckoutBar extends StatelessWidget {
  const CheckoutBar({
    super.key,
    required this.cart,
  });

  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total: \$${cart.totalPrice().parsePrice()}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
            Button(
                onPressed: () => cart.checkout(),
                text: StringConstants.checkout)
          ],
        ),
      ),
    );
  }
}
