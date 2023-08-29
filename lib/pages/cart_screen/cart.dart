
import 'package:flutter/material.dart';


import 'package:velocity_x/velocity_x.dart';


import '../../consts/colors.dart';
import '../../consts/styles.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: "Cart is Empty!".text.fontFamily(bold).color(darkFontGrey).makeCentered()
    );
  }
}