
import 'package:e_store/controller/product_controller.dart';
import 'package:e_store/widget_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../consts/colors.dart';


import '../../consts/consts.dart';
import '../../consts/styles.dart';
import 'items_details.dart';


class CategoryDetail extends StatelessWidget {
  final String? title;
  const CategoryDetail({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return bgWidget(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: title!.text.fontFamily(bold).black.make(),
            ),
            body: SingleChildScrollView(
              child: Container(
                  child: Column(children: [
                    
                SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: List.generate(
                       controller.subcat.length,
                             (index) => 
                           "${controller.subcat[index]}"
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .makeCentered()
                                .box
                                .white
                                .rounded
                                .size(120,50)
                                .margin(EdgeInsets.symmetric(horizontal: 4))
                                .make()))),
                                Column(
                    children: [
                     
                    
                          
                        
                      
                      5.heightBox,
                      Container(
                          child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 8,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                  mainAxisExtent: 300),
                              itemBuilder: ((context, index) {
                                return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                      Image.asset(
                                        imgP1,
                                        height: 200,
                                        width: 200,
                                        fit: BoxFit.fill,
                                      ),
                                      25.heightBox,
                                      "Laptop"
                                          .text
                                          .fontFamily(semibold)
                                          .color(darkFontGrey)
                                          .make(),
                                      10.heightBox,
                                      "\$500"
                                          .text
                                          .fontFamily(semibold)
                                          .color(redColor)
                                          .make()
                                    ])
                                    .box
                                    .white
                                    .shadowSm
                                    .margin(const EdgeInsets.symmetric(
                                      horizontal: 4,
                                    ))
                                    .roundedSM
                                    .padding(EdgeInsets.all(8))
                                    .height(300)
                                    .make()
                                    .onTap(() {
                                  Get.to(() => ItemDetails(title: "Dummy"));
                                });
                              }))),
              ]
              )
              ])
              ),
            )
            ));
  }
}
