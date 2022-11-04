import 'package:product_catalog_app/core/const/urls.dart';
import 'package:product_catalog_app/core/data/services/product_services.dart';
import 'package:product_catalog_app/domain/models/product.dart';

class ProductRepositories {
  final ProductServices _productServices = ProductServices();

  Future<Products?> getAllProduct() async {
    Products products = await _productServices.get(Urls.PRODUCT_ALL);

    return products;
  }
}
