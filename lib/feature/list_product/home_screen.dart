import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sera/feature/list_product/home_presenter.dart';
import 'package:sera/widgets/list_product_card.dart';

import '../../widgets/header_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomePresenter presenter;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight) / 3;
    final double itemWidth = size.width / 2.7;

    presenter = Provider.of<HomePresenter>(context);
    presenter.getListProduct();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Shop IT",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              onTap: (){

              },
              child: const Icon(
                Icons.search_sharp,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: InkWell(
              onTap: (){},
              child: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: <Widget>[
            const HeaderWidget('Jhon'),
            presenter.listProduct.isNotEmpty
                ? GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 7,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: (itemWidth / itemHeight),
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListProductCard(
                          product: presenter.listProduct[index],
                          onClick: () {},
                        ),
                      );
                    })
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}