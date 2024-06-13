import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/core/constants/string_constants.dart';
import 'package:shopping_app/feature/favorite/favorite_model.dart';
import 'package:shopping_app/product/widgets/favorites/empty_favorite.dart';
import 'package:shopping_app/product/widgets/favorites/product_favorite_tile.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: const Text(StringConstants.favorites,
            style: TextStyle(color: Colors.black)),
      ),
      body: Consumer(
        builder: (context, value, child) {
          final favorites = context.watch<FavoriteModel>();
          return favorites.favorites.isEmpty
              ? const EmptyFavorite()
              : ListView.builder(
                  itemCount: favorites.favorites.length,
                  itemBuilder: (context, index) {
                    final product = favorites.favorites[index];
                    return ProductFavoriteTile(product: product);
                  },
                );
        },
      ),
    );
  }
}
