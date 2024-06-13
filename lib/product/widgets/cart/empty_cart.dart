import 'package:flutter/material.dart';

import '../../../core/constants/string_constants.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart, size: 100),
          SizedBox(height: 10),
          Text(StringConstants.emptyCart, style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Text(StringConstants.emptyCartSubtitle),
        ],
      ),
    );
  }
}
