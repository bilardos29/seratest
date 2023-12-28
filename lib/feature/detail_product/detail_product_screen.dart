import 'package:flutter/material.dart';
import 'package:sera/model/product.dart';

import '../../widgets/base_widget.dart';
import '../../widgets/main_button.dart';
import '../../widgets/review_widget.dart';
import '../../widgets/space_widget.dart';

class DetailProductScreen extends StatefulWidget {
  final Product product;

  const DetailProductScreen({required this.product, Key? key})
      : super(key: key);

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.black54,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: InkWell(
              onTap: () {
                //Push to Cart screen
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) =>
                //             DetailMoviePage(
                //                 movieId:
                //                 model.id ?? 0)));
              },
              child: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black54,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView(
          children: <Widget>[
            Image.network(
              widget.product.image!,
              height: 300,
            ),
            const Space(h: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('USD ${widget.product.price ?? 0}',
                    style: BaseWidget.mainTextStyle(
                        size: 16, colors: Colors.green)),
                Image.asset(
                  "images/ic_like.png",
                  width: 20,
                  height: 20,
                  color: Colors.green,
                )
              ],
            ),
            const Space(h: 8),
            Text(widget.product.title ?? '',
                // overflow: TextOverflow.fade,
                // maxLines: 3,
                style: BaseWidget.h1TextStyle()),
            const Space(h: 8),
            Row(
              children: [
                ReviewWidget(
                  widget.product.rating?.rate ?? 0,
                  color: Colors.grey,
                ),
                const Space(w: 12),
                Text('${widget.product.rating?.count ?? 0} Reviews',
                    style: BaseWidget.mainTextStyle(colors: Colors.grey)),
              ],
            ),
            const Space(h: 16),
            Text(widget.product.description ?? '',
                overflow: TextOverflow.fade, style: BaseWidget.mainTextStyle()),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16),
        child: MainButton(
          'Add to Cart',
          onClick: () {},
        ),
      ),
    );
  }
}
