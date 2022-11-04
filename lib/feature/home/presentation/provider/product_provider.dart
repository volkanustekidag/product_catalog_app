import 'package:flutter/material.dart';
import 'package:product_catalog_app/core/data/repositories/product_repositories.dart';
import 'package:product_catalog_app/domain/models/product.dart';

class ProductProvider extends ChangeNotifier {
  Products? products;

  getAllProduct() async {
    products = await ProductRepositories().getAllProduct();
    print("provider ");
    notifyListeners();
  }

  unlikeProduct(id) {
    products?.favCount?.remove(id);
    print(id);
    notifyListeners();
  }

  likeProduct(id) {
    products?.favCount?.add(id);

    for (var element in products!.favCount!) {
      print(element);
    }
    print("********************");
    notifyListeners();
    for (var element in products!.favCount!) {
      print(element);
    }
  }
}
