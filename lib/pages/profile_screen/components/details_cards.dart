


import 'package:e_store/consts/colors.dart';
import 'package:e_store/consts/styles.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget detailsCard({width,String? count,String?title}){
  return  Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    "00".text.fontFamily(bold).color(white).size(16).make(),
    5.heightBox,
    "in your cart".text.color(white).make()
  ]
  ).box.black.rounded.width(100).height(80).padding(const EdgeInsets.all(4)).make();
}