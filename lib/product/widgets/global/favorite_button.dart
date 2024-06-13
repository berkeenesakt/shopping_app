import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../feature/favorite/favorite_model.dart';
import '../../models/product_model.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        context.watch<FavoriteModel>().isFavorite(product)
            ? Icons.favorite
            : Icons.favorite_border,
        color: context.watch<FavoriteModel>().isFavorite(product)
            ? Colors.red
            : Colors.grey,
      ),
      onPressed: () {
        context.read<FavoriteModel>().toggleFavorite(product);
      },
    );
  }
}
