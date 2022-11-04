import 'package:product_catalog_app/core/const/urls.dart';
import 'package:product_catalog_app/feature/home/data/services/product_services.dart';
import 'package:product_catalog_app/feature/home/domain/models/product.dart';

class ProductRepositories {
  final ProductServices _productServices = ProductServices();

  Future<Products?> getAllProduct() async {
    Products products = await _productServices.get(Urls.PRODUCT_ALL);
    return products;
  }

  Future likeProduct(id) async {
    Map<String, dynamic> likeBody = {"productId": id};
    await _productServices.post(likeBody, Urls.PRODUCT_LIKE);
  }

  Future unlikeProduct(id) async {
    Map<String, dynamic> likeBody = {"productId": id};
    var a = await _productServices.post(likeBody, Urls.PRODUCT_UNLIKE);

    print(a);
  }
}
