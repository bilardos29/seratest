import 'package:sera/model/product.dart';

class CartProduct{
  int? productId;
  int? quantity;
  Product? product;

  CartProduct({this.productId, this.quantity, this.product});

  CartProduct.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    data['quantity'] = quantity;
    return data;
  }
}