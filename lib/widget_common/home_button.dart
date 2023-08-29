
import 'package:e_store/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../consts/styles.dart';

Widget homeButton(  {required  width, required icon, required double height, required String? title}){
return Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Image.asset(icon , width: 26,),
    5.heightBox,
    title!.text.fontFamily(semibold).color(darkFontGrey).make()
  ],
).box.rounded.white.size(width, height).make();
}