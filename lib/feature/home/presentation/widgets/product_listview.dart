import 'package:flutter/material.dart';
import 'package:product_catalog_app/core/widgets/favorite_icon.dart';
import 'package:product_catalog_app/core/widgets/product_image.dart';
import 'package:product_catalog_app/domain/models/product.dart';
import 'package:product_catalog_app/feature/product_detail/product_detail_screen.dart';

class ProductListview extends StatelessWidget {
  const ProductListview({
    Key? key,
    required this.products,
  }) : super(key: key);

  final Products? products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products?.products?.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProductDetail(product: products?.products?[index]),
              )),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "${products?.products?[index].name}",
                      ),
                      ProductImage(product: products?.products?[index]),
                      FavoriteButton(
                        products: products,
                        product: products?.products?[index],
                      )
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
