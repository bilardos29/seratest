import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sera/feature/cart/cart_presenter.dart';
import 'package:sera/widgets/base_widget.dart';
import 'package:sera/widgets/cart_product_card.dart';

import '../../widgets/checkout_button.dart';
import '../../widgets/space_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartPresenter presenter;

  @override
  Widget build(BuildContext context) {
    presenter = Provider.of<CartPresenter>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:
            const Text("Shopping Cart", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0.0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child:
                const Icon(Icons.arrow_back_ios_sharp, color: Colors.black54)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: InkWell(
                onTap: () {},
                child: const Icon(Icons.delete, color: Colors.black54)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: <Widget>[
            const Space(h: 12),
            presenter.listCartProduct.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: presenter.listCartProduct.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: CartProductCard(
                          cartProduct: presenter.listCartProduct[index],
                          onMinus: () {},
                          onAdd: () {},
                          onDelete: () {},
                        ),
                      );
                    })
                : SizedBox()
          ],
        ),
      ),
      bottomSheet: Container(
        height: 120,
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Total ${presenter.totalCartItem} items',
                  style: BaseWidget.mainTextStyle(
                      size: 14,
                      colors: Colors.black54,
                      fWeight: FontWeight.w500)),
              Text(
                'USD ${presenter.totalCartPrice}',
                style: BaseWidget.mainTextStyle(size: 14),
              ),
            ]),
            const Space(h: 12),
            CheckoutButton(
              'Proceed to Checkout',
              onClick: () {},
            ),
          ],
        ),
      ),
    );
  }
}
