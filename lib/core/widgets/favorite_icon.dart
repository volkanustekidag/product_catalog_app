import 'package:flutter/material.dart';
import 'package:product_catalog_app/feature/home/presentation/provider/product_provider.dart';
import 'package:provider/provider.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({Key? key, required this.products, this.product})
      : super(key: key);

  final products;
  final product;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(products!.favCount!.contains(product.id)
          ? Icons.favorite
          : Icons.favorite_border),
      onPressed: () => products!.favCount!.contains(product.id)
          ? context.read<ProductProvider>().unlikeProduct(product.id)
          : context.read<ProductProvider>().likeProduct(product.id),
    );
  }
}
