import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sera/feature/cart/cart_presenter.dart';
import 'package:sera/feature/search/search_presenter.dart';
import 'package:sera/widgets/base_widget.dart';

import '../../widgets/search_product_card.dart';
import '../../widgets/search_widget.dart';
import '../../widgets/space_widget.dart';
import '../cart/cart_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController search = TextEditingController();
  late SearchPresenter presenter;
  late CartPresenter cartPresenter;

  @override
  Widget build(BuildContext context) {
    presenter = Provider.of<SearchPresenter>(context);
    cartPresenter = Provider.of<CartPresenter>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Search", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0.0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.black54,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: InkWell(
              onTap: () {
                //Push to Cart screen
                cartPresenter.getListCart().whenComplete(() => BaseWidget.push(context, const CartScreen()));
              },
              child: const Icon(Icons.shopping_cart_outlined,
                  color: Colors.black54),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: <Widget>[
            SearchWidget(
              hint: 'Search',
              controller: search,
              onChanged: (val) {
                presenter.getListProduct(search.text);
              },
            ),
            const Space(h: 12),
            presenter.listSearch.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: presenter.listSearch.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: SearchProductCard(
                            product: presenter.listSearch[index],
                            onClick: () {}),
                      );
                    })
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
