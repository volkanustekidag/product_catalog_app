import 'package:flutter/material.dart';
import 'package:product_catalog_app/core/widgets/product_image.dart';
import 'package:product_catalog_app/feature/product_detail/widgets/product_detail_row.dart';

class ProductDetail extends StatelessWidget {
  final product;
  const ProductDetail({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product Detail",
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "${product.name}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ProductImage(product: product),
                  ProductDetailRow(value: product.price, title: "Price"),
                  ProductDetailRow(value: product.timeStamp, title: "Time"),
                  ProductDetailRow(value: product.likes, title: "Likes"),
                ],
              ),
            ),
          )),
    );
  }
}
