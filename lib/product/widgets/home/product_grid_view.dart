import 'package:flutter/material.dart';
import 'package:shopping_app/product/widgets/home/product_card_grid.dart';

import '../../../core/data/sample_data.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return ProductGrid(
          product: sampleProducts[index],
        );
      },
    );
  }
}
