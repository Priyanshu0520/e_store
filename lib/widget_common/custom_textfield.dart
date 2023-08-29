
import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

import '../consts/colors.dart';
import '../consts/styles.dart';

Widget customTextField({String? title,String?hint,isPass , controller }){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
   children: [
    title!.text.color(black).fontFamily(semibold).make(),
    5.heightBox,
    TextFormField(
      controller: controller,
      obscureText: isPass,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          fontFamily: semibold,

          color: textfieldGrey
        ),
        hintText: hint,
        isDense: true,
        fillColor: lightGrey,
        filled: true,
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.yellow))
      ),
    ),
    5.heightBox,

   ],
  );
}