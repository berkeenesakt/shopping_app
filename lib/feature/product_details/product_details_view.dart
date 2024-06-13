import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/core/constants/string_constants.dart';
import 'package:shopping_app/feature/cart/cart_model.dart';
import 'package:shopping_app/feature/favorite/favorite_model.dart';
import 'package:shopping_app/product/models/product_model.dart';

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
                  '\$${product.price}',
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
                        return IconButton(
                          icon: Icon(
                            context.watch<FavoriteModel>().isFavorite(product)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: context
                                    .watch<FavoriteModel>()
                                    .isFavorite(product)
                                ? Colors.red
                                : Colors.grey,
                          ),
                          onPressed: () {
                            context
                                .read<FavoriteModel>()
                                .toggleFavorite(product);
                          },
                        );
                      },
                    ),
                    Consumer(
                      builder: (context, value, child) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[400],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          onPressed: () {
                            context.read<CartModel>().addToCart(product);
                          },
                          child: const Text(StringConstants.addToCart),
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
