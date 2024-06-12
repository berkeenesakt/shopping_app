import 'package:flutter/material.dart';
import 'package:shopping_app/product/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final bool isGrid;
  const ProductCard({super.key, required this.product, this.isGrid = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(product.image),
          fit: BoxFit.contain,
        ),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 2),
            blurRadius: 6,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$${product.price}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
