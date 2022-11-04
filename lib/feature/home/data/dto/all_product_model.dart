import 'package:product_catalog_app/feature/home/domain/models/product.dart';

class AllProductModel {
  String? reason;
  List<ProductModel>? products;

  AllProductModel({this.reason, this.products});

  AllProductModel.fromJson(Map<String, dynamic> json) {
    reason = json['reason'];
    if (json['products'] != null) {
      products = <ProductModel>[];
      json['products'].forEach((v) {
        products!.add(ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reason'] = reason;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Products toEntity() {
    final productEntity = Products(
        favCount: List.generate(products!.length,
            (index) => products![index].likes != 0 ? products![index].id! : -1),
        products: List<Product>.generate(
            products!.length, (index) => products![index].toEntity()));

    productEntity.favCount!.removeWhere((element) => element == -1);

    return productEntity;
  }
}

class ProductModel {
  int? id;
  String? name;
  int? price;
  String? image;
  String? description;
  String? timeStamp;
  int? likes;

  ProductModel(
      {this.id,
      this.name,
      this.price,
      this.image,
      this.description,
      this.timeStamp,
      this.likes});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
    timeStamp = json['timeStamp'];
    likes = json['likes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['image'] = image;
    data['description'] = description;
    data['timeStamp'] = timeStamp;
    data['likes'] = likes;
    return data;
  }

  Product toEntity() => Product(
      id: id,
      name: name,
      price: price,
      image: image,
      description: description,
      timeStamp: timeStamp,
      likes: likes);
}
