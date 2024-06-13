import 'package:flutter/foundation.dart';
import 'package:shopping_app/product/models/product_model.dart';

class FavoriteModel extends ChangeNotifier {
  final List<ProductModel> _favorites = [];

  List<ProductModel> get favorites => _favorites;

  void addToFavorites(ProductModel item) {
    _favorites.add(item);
    notifyListeners();
  }

  void removeFromFavorites(ProductModel item) {
    _favorites.remove(item);
    notifyListeners();
  }

  void toggleFavorite(ProductModel item) {
    if (_favorites.contains(item)) {
      removeFromFavorites(item);
    } else {
      addToFavorites(item);
    }
  }

  bool isFavorite(ProductModel item) {
    return _favorites.contains(item);
  }
}
