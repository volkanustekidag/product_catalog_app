import 'package:flutter/material.dart';
import 'package:product_catalog_app/core/widgets/favorite_icon.dart';
import 'package:product_catalog_app/core/widgets/product_image.dart';
import 'package:product_catalog_app/feature/home/presentation/provider/product_provider.dart';
import 'package:provider/provider.dart';

class ProductFavList extends StatelessWidget {
  const ProductFavList({super.key});

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<ProductProvider>(context).products;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite List"),
      ),
      body: ListView.builder(
        itemCount: products?.products?.length,
        itemBuilder: (context, index) {
          if (products!.favCount!.contains(products.products![index].id)) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "${products.products?[index].name}",
                        ),
                        ProductImage(product: products.products?[index]),
                        FavoriteButton(
                          products: products,
                          product: products.products?[index],
                        )
                      ],
                    ),
                  ),
                ));
          }
          return Container();
        },
      ),
    );
  }
}
