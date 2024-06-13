import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:shopping_app/core/constants/string_constants.dart';

import '../../product/widgets/cart/cart_list_tile.dart';
import '../../product/widgets/cart/checkout_bar.dart';
import '../../product/widgets/cart/empty_cart.dart';
import 'cart_model.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, value, child) {
        final cart = context.watch<CartModel>();
        if (cart.done) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text(StringConstants.orderPlaced),
                  content: const Text(StringConstants.orderPlacedSubtitle),
                  actions: [
                    TextButton(
                      onPressed: () {
                        cart.doneShopping();
                        Navigator.of(context).pop();
                      },
                      child: const Text(StringConstants.ok),
                    )
                  ],
                );
              },
            );
          });
        }
        return Scaffold(
            bottomNavigationBar:
                cart.items.isEmpty ? const SizedBox() : CheckoutBar(cart: cart),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              title: const Text(StringConstants.cart,
                  style: TextStyle(color: Colors.black)),
            ),
            body: cart.items.isEmpty
                ? const EmptyCart()
                : ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final product = cart.items[index].product;
                      return CartListTile(
                          product: product,
                          cart: cart.items[index],
                          cartModel: cart);
                    },
                  ));
      },
    );
  }
}
