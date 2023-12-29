import 'package:flutter/cupertino.dart';

import '../../model/cart.dart';
import '../../model/cart_product.dart';
import '../../model/product.dart';
import '../../utils/api.dart';

class CartPresenter extends ChangeNotifier {
  List<CartProduct> listCartProduct = [];
  int totalCartItem = 0;
  double totalCartPrice = 0;

  Future<void> getListCart({int user = 3}) async {
    listCartProduct.clear();
    totalCartItem = 0;
    totalCartPrice = 0;
    var api = Api(path: "/carts/user/$user");

    api.request(
        onError: (val) {},
        onSuccess: (response) async {
          List<Cart> listCart =
              List<Cart>.from(response.map((model) => Cart.fromJson(model)));

          for (int i = 0; i < listCart.length; i++) {
            for (int j = 0; j < listCart[i].products!.length; j++) {
              CartProduct item = listCart[i].products![j];
              getProduct(item.productId ?? 0, onSuccess: (val) {
                item.product = val;
                listCartProduct.add(item);
                totalCartItem += item.quantity ?? 0;
                totalCartPrice += val.price ?? 0;
                notifyListeners();
              });
            }
          }
        });
  }

  void getProduct(int id, {required ValueChanged<Product> onSuccess}) {
    var api = Api(path: "/products/$id");
    api.request(
        onError: (val) {},
        onSuccess: (response) async {
          Product item = Product.fromJson(response);
          onSuccess(item);
        });
  }
}
