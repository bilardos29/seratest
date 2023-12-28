import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  final double n;
  const Space(this.n, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: n);
  }
}
