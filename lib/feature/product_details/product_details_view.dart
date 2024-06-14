import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/core/constants/string_constants.dart';
import 'package:shopping_app/core/extensions/price_parse_extension.dart';
import 'package:shopping_app/feature/cart/cart_model.dart';
import 'package:shopping_app/product/models/product_model.dart';
import 'package:shopping_app/product/widgets/cart/cart_item_quantity.dart';

import '../../product/widgets/global/button.dart';
import '../../product/widgets/global/favorite_button.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${product.price.parsePrice()}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red[500],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Consumer(
                      builder: (context, value, child) {
                        return FavoriteButton(product: product);
                      },
                    ),
                    Consumer(
                      builder: (context, value, child) {
                        final cartModel = context.watch<CartModel>();
                        return cartModel.contains(product)
                            ? SizedBox(
                                width: 120,
                                height: 40,
                                child: CartItemQuantity(
                                    cart: cartModel.items.firstWhere(
                                        (element) =>
                                            element.product == product),
                                    cartModel: cartModel,
                                    product: product),
                              )
                            : Button(
                                onPressed: () {
                                  cartModel.addToCart(product, context);
                                },
                                text: StringConstants.addToCart,
                              );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: 250.0,
                floating: false,
                pinned: true,
                iconTheme: const IconThemeData(color: Colors.black),
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return FlexibleSpaceBar(
                      centerTitle: true,
                      title: constraints.biggest.height > kToolbarHeight
                          ? null
                          : Text(product.name,
                              style: const TextStyle(color: Colors.black)),
                      background: Image.asset(
                        product.image,
                        fit: BoxFit.fitHeight,
                      ),
                    );
                  },
                ),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  product.description,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
