import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:shopping_app/core/constants/string_constants.dart';
import 'package:shopping_app/product/widgets/global/button.dart';

import '../../product/widgets/cart/cart_list_tile.dart';
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
            bottomNavigationBar: cart.items.isEmpty
                ? SizedBox()
                : Container(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total: \$${cart.totalPrice()}',
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
                  ),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              title: const Text('Cart', style: TextStyle(color: Colors.black)),
            ),
            body: cart.items.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart, size: 100),
                        SizedBox(height: 10),
                        Text(StringConstants.emptyCart,
                            style: TextStyle(fontSize: 20)),
                        SizedBox(height: 10),
                        Text(StringConstants.emptyCartSubtitle),
                      ],
                    ),
                  )
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
