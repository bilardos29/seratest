import 'package:flutter/cupertino.dart';
import 'package:sera/model/product.dart';

import '../../utils/api.dart';

class HomePresenter extends ChangeNotifier {
  List<Product> listProduct = [];

  void getCategory(){
    var api = Api(path: "/products/categories");

    api.request(onError: (val) {
      print(val);
    }, onSuccess: (response) async {
      //ResponseListModel data = ResponseListModel.fromJson(response);
      notifyListeners();
    });
  }


  void getListProduct() async {
    var qString = {
      "limit": '10',
    };
    var api = Api(path: "/products", queryString: qString);

    api.request(onError: (val) {
      print(val);
    }, onSuccess: (response) async {
      listProduct = List<Product>.from(response.map((model)=> Product.fromJson(model)));
      notifyListeners();
    });
  }
}