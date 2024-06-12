import 'package:shopping_app/core/constants/image_constants.dart';

import '../../product/models/product_model.dart';

List<ProductModel> sampleProducts = [
  ProductModel(
    image: ImageConstants.macbook.dir,
    name: 'MacBook Pro 16"',
    description: "A powerful notebook with M3 Pro chip",
    price: 2.499,
  ),
  ProductModel(
    image: ImageConstants.ipadPro.dir,
    name: 'iPad Pro 11"',
    description: "A powerful tablet with M4 chip",
    price: 999.00,
  ),
  ProductModel(
    image: ImageConstants.iphone15Pro.dir,
    name: 'iPhone 15 Pro',
    description: "A powerful phone with A15 chip",
    price: 999.00,
  ),
  ProductModel(
    image: ImageConstants.watchSeries9.dir,
    name: 'Watch Series 9',
    description: "A powerful watch with W9 chip",
    price: 499.00,
  ),
  ProductModel(
    image: ImageConstants.airpodsPro.dir,
    name: 'AirPods Pro',
    description: "A great earphone with ANC",
    price: 249.00,
  ),
  ProductModel(
    image: ImageConstants.ipadAir.dir,
    name: 'iPad Air',
    description: "A great tablet with M2 chip",
    price: 599.00,
  ),
];
