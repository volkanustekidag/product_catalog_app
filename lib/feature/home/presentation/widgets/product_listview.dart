import 'package:flutter/material.dart';
import 'package:product_catalog_app/domain/models/product.dart';
import 'package:product_catalog_app/feature/home/presentation/provider/product_provider.dart';
import 'package:provider/provider.dart';

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
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "${products?.products?[index].name}",
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                                ("https://assignment-api.piton.com.tr${products!.products?[index].image}")),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "${products?.products?[index].description}",
                            ),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(products!.favCount!
                              .contains(products!.products![index].id)
                          ? Icons.favorite
                          : Icons.favorite_border),
                      onPressed: () => products!.favCount!
                              .contains(products!.products![index].id)
                          ? context
                              .read<ProductProvider>()
                              .unlikeProduct(products!.products?[index].id)
                          : context
                              .read<ProductProvider>()
                              .likeProduct(products!.products?[index].id),
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
