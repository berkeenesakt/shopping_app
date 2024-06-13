import 'package:flutter/material.dart';
import 'package:shopping_app/core/constants/string_constants.dart';

import 'package:shopping_app/product/widgets/home/product_grid_view.dart';

import '../../product/widgets/home/product_page_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                StringConstants.hiThere,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          ProductPageView(),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(StringConstants.listings,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Expanded(child: ProductGridView()),
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}
