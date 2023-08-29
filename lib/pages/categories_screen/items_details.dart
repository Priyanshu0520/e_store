import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../consts/colors.dart';
import '../../consts/firebase_const.dart';
import '../../consts/images.dart';
import '../../consts/lists.dart';
import '../../consts/strings.dart';
import '../../consts/styles.dart';


class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
          title: title!.text.color(black).fontFamily(bold).make(),
          backgroundColor: white,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  color: darkFontGrey,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_outline, color: darkFontGrey))
          ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              color: white,
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VxSwiper.builder(
                        autoPlay: true,
                        height: 350,
                        aspectRatio: 16 / 9,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            imgFc5,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        }),
                    10.heightBox,
                    title!.text
                        .size(16)
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .make(),
                    10.heightBox,
                    VxRating(
                      onRatingUpdate: (value) {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      count: 5,
                      size: 25,
                      stepInt: true,
                    ),
                    10.heightBox,
                    "\$30,000"
                        .text
                        .color(redColor)
                        .fontFamily(bold)
                        .size(18)
                        .make(),
                    10.heightBox,
                    // ignore: prefer_const_constructors
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            5.heightBox,
                            "Seller".text.white.fontFamily(semibold).make(),
                            5.heightBox,
                            "In House Brands"
                                .text
                                .white
                                .fontFamily(bold)
                                .size(17)
                                .color(darkFontGrey)
                                .make()
                          ],
                        )),
                        const CircleAvatar(
                          backgroundColor: white,
                          child: Icon(
                            Icons.message_rounded,
                            color: darkFontGrey,
                          ),
                        )
                      ],
                    )
                        .box
                        .height(60)
                        .padding(EdgeInsets.symmetric(horizontal: 16))
                        .color(textfieldGrey)
                        .make(),
                    20.heightBox,
                    Column(
                      children: [
                        Row(
                          
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Color :".text.fontFamily(semibold).color(Colors.grey).make(),
                            ),
                            Row(
                                children: List.generate(
                                    3,
                                    (index) => VxBox()
                                        .size(35, 35)
                                        .roundedFull
                                        .color(Vx.randomPrimaryColor)
                                        .margin(
                                            EdgeInsets.symmetric(horizontal: 4))
                                        .make()))
                                        ,
                                      
                                        
                          ],
                        ).box.padding(EdgeInsets.all(8)).make(),
                         Row(
                               
                                          children: [
                                             SizedBox(
                              width: 100,
                              child: "Quantity:".text.fontFamily(semibold).color(Colors.grey).make(),
                            ),
                                               IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
                                  "0".text.size(16).color(darkFontGrey).fontFamily(bold).make(), 
                                  10.widthBox,
                                  IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                                  "(0 available)".text.color(Colors.grey).make(),
                                          ],
                                        ).box.padding(EdgeInsets.all(8)).make(),
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Total: ".text.fontFamily(semibold).color(Colors.grey).make(),
                        ),
                        "\$0.00".text.color(redColor).size(16).fontFamily(bold).make()
                      ],
                    ).box.padding(const EdgeInsets.all(8)).make()
                      ],
                    ).box.white.shadowSm.make(),

                    //description
                    10.heightBox,
                           
                  "Description".text.color(darkFontGrey).fontFamily(semibold).make(),

                  10.heightBox,
                  "This is dumy item and dumy description sbbf ijfi eifjief  ffhfif efheif hfi efie ....".text.color(darkFontGrey).make(),

                  ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: 
                      List.generate(itemdetailButtonList.length, (index) => ListTile(
                        trailing: Icon(Icons.arrow_forward_ios),
                       title: itemdetailButtonList[index].text.semiBold.color(darkFontGrey).make(),
                      )),
                    
                   
                    
                  ),10.heightBox,
                 



                  
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
              width: double.infinity,
              height: 60,
              child: Container(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: redColor),
                    onPressed: () {},
                    child: Container(
                      child: Text("Add To Cart"),
                    )),
              ))
        ],
      ),
    );
  }
}
