import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/feature/cart/cart_model.dart';
import 'package:shopping_app/feature/favorite/favorite_model.dart';

import 'package:shopping_app/feature/main/main_view.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartModel()),
        ChangeNotifierProvider(create: (context) => FavoriteModel()),
      ],
      child: MaterialApp(
        home: const MainView(),
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
      )));
}
