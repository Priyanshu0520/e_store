import 'dart:ui';

import 'package:e_store/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../consts/colors.dart';

import '../../consts/lists.dart';
import '../../consts/strings.dart';
import '../../consts/styles.dart';



import '../../widget_common/bg_widget.dart';
import 'cateory_details.dart';
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {

     var controller = Get.put(ProductController());
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
              backgroundColor: Colors.transparent,
               elevation: 0,
          title: categories.text.fontFamily(bold).black.make(),
        ),
        body:Container(
          padding: EdgeInsets.all(12),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3 ,crossAxisSpacing: 8,mainAxisExtent: 200,mainAxisSpacing: 8,), itemBuilder: (context,index){
            return Column(
              children: [
                Image.asset(categoriesimg[index], height: 120, width: 200, fit: BoxFit.cover,),10.heightBox,
                categorieslist[index].text.color(darkFontGrey).align(TextAlign.center).make()
              ],
            ).box.white.rounded.clip(Clip.antiAlias).shadowMd.make().onTap(() {

         controller.getSubCategories(categorieslist[index]);
              Get.to(()=>CategoryDetail(title: categorieslist[index]));
            });
          }),
        )
    
      ),
    );
  }
}

