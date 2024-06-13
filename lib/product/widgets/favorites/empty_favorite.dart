import 'package:flutter/material.dart';

import '../../../core/constants/string_constants.dart';

class EmptyFavorite extends StatelessWidget {
  const EmptyFavorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.favorite, size: 100),
            SizedBox(height: 10),
            Text(StringConstants.favoriteEmpty, style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text(
              StringConstants.favoriteEmptySubtitle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
