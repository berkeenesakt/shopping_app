import 'package:flutter/material.dart';
import 'package:shopping_app/core/extensions/price_parse_extension.dart';
import 'package:shopping_app/feature/cart/cart_model.dart';
import 'package:shopping_app/feature/product_details/product_details_view.dart';
import '../../models/cart_item_model.dart';
import '../../models/product_model.dart';

class CartListTile extends StatelessWidget {
  const CartListTile({
    super.key,
    required this.product,
    required this.cart,
    required this.cartModel,
  });

  final ProductModel product;
  final CartItemModel cart;
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ProductDetailsView(product: product);
          },
        ));
      },
      child: Container(
        height: 100,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(
                product.image,
                height: 100,
                width: 100,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '\$${(product.price * cart.quantity).parsePrice()}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: cart.quantity == 1
                        ? const Icon(Icons.delete_outline_rounded)
                        : const Icon(Icons.remove),
                    onPressed: () {
                      cartModel.decreaseQuantity(product);
                    },
                  ),
                  SizedBox(
                    width: 24,
                    child: Center(
                      child: Text(
                        '${cart.quantity}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      cartModel.increaseQuantity(product);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
