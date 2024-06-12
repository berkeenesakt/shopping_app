import 'package:flutter/material.dart';

import '../../../core/data/sample_data.dart';
import 'product_card.dart';

class ProductPageView extends StatefulWidget {
  const ProductPageView({super.key});

  @override
  State<ProductPageView> createState() => _ProductPageViewState();
}

class _ProductPageViewState extends State<ProductPageView> {
  final PageController controller = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: SizedBox(
            height: 200,
            child: PageView.builder(
                controller: controller,
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: ProductCard(product: sampleProducts[index]),
                  );
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              margin: const EdgeInsets.all(4),
              height: 8,
              width: currentPage == index ? 24 : 8,
              decoration: BoxDecoration(
                color: currentPage == index ? Colors.blue : Colors.grey,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
      ],
    );
  }
}
