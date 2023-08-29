import 'dart:ui';

import 'package:e_store/consts/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../../../consts/colors.dart';


Widget featureButton({String? title, icon}){
return Row(children: [
  Image.asset(icon, width: 45,fit: BoxFit.fill,),
  10.widthBox,
  title!.text.fontFamily(semibold).color(darkFontGrey).make()
],).box.width(175).height(60).white.margin(EdgeInsets.symmetric(horizontal: 4)).padding(EdgeInsets.all(4)).rounded.outerShadow.make();
}