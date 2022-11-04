import 'package:flutter/material.dart';
import 'package:product_catalog_app/feature/home/data/repositories/product_repositories.dart';
import 'package:product_catalog_app/feature/home/domain/models/product.dart';

class ProductProvider extends ChangeNotifier {
  Products? products;

  getAllProduct() async {
    products = await ProductRepositories().getAllProduct();
    notifyListeners();
  }

  unlikeProduct(id) async {
    products?.favCount?.remove(id);
    await ProductRepositories().unlikeProduct(id.toString());
    notifyListeners();
  }

  likeProduct(id) async {
    products?.favCount?.add(id);
    await ProductRepositories().likeProduct(id.toString());
    notifyListeners();
  }
}
