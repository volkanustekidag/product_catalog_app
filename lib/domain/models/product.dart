import 'package:equatable/equatable.dart';

class Products extends Equatable {
  String? reason;
  List<Product>? products;
  List<int>? favCount;

  Products({this.reason, this.products, this.favCount});

  @override
  // TODO: implement props
  List<Object?> get props => [reason, products, favCount];
}

class Product extends Equatable {
  int? id;
  String? name;
  int? price;
  String? image;
  String? description;
  String? timeStamp;
  int? likes;

  Product(
      {this.id,
      this.name,
      this.price,
      this.image,
      this.description,
      this.timeStamp,
      this.likes});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, name, price, image, description, timeStamp, likes];
}
