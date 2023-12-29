import 'package:flutter/material.dart';
import 'package:sera/model/cart_product.dart';
import 'package:sera/widgets/review_widget.dart';
import 'package:sera/widgets/space_widget.dart';

import 'base_widget.dart';
import 'counter_widget.dart';

class CartProductCard extends StatelessWidget {
  final CartProduct? cartProduct;
  final VoidCallback onMinus;
  final VoidCallback onAdd;
  final VoidCallback onDelete;

  const CartProductCard(
      {this.cartProduct,
      required this.onMinus,
      required this.onAdd,
      required this.onDelete,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey, width: 0.5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Image.network(cartProduct!.product!.image!,
                width: 72, height: 72),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cartProduct!.product!.title ?? 'shopp',
                      overflow: TextOverflow.fade,
                      maxLines: 3,
                      style: BaseWidget.mainTextStyle()),
                  const Space(h: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('USD ${cartProduct!.product!.price ?? 0}',
                          style: BaseWidget.mainTextStyle()),
                    ],
                  ),
                  const Space(h: 16),
                  CounterWidget(
                      total: cartProduct!.quantity ?? 0,
                      onMinus: onMinus,
                      onAdd: onAdd,
                      onDelete: onDelete),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
