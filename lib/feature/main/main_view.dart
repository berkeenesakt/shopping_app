import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shopping_app/core/constants/string_constants.dart';

import '../cart/cart_view.dart';
import '../favorite/favorite_view.dart';
import '../home/home_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final list = const [
    HomeView(),
    FavoriteView(),
    CartView(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: index,
        onTap: (page) => setState(() {
          index = page;
        }),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text(StringConstants.home),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.favorite),
            title: const Text(StringConstants.favorite),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.shopping_cart),
            title: const Text(StringConstants.cart),
          ),
        ],
      ),
      body: list[index],
    );
  }
}
