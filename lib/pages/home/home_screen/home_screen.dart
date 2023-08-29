import 'dart:ui';

import 'package:e_store/widget_common/home_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../../consts/colors.dart';
import '../../../consts/consts.dart';
import '../../../consts/lists.dart';
import 'components/feature_button.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      color: Colors.grey.shade100,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
          child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 60,
            color: lightGrey,
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: white,
                  hintText: "Search anything..",
                  hintStyle: TextStyle(color: textfieldGrey)),
            ),
          ),

          //swipper
         10.heightBox,
         Expanded(
           child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
             child: Column(
              children: [ VxSwiper.builder(
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  
                  height: 150,
                  enlargeCenterPage: true,
                  itemCount: sliderlist.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      sliderlist[index],
                      fit: BoxFit.fill,
                    ).box
                        .rounded
                        .margin(const EdgeInsets.symmetric(horizontal: 10))
                        .clip(Clip.antiAlias).make();
                        
                  }),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    2,
                    (index) => homeButton(
                          width: context.width / 2.5,
                          height: context.screenHeight * 0.15,
                          icon: index == 0 ? icTodaysDeal : icFlashDeal,
                          title: index == 0 ? flashsale : todayDeal,
                        ))
              ),
              10.heightBox,
              VxSwiper.builder(
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  height: 150,
                  enlargeCenterPage: true,
                  itemCount: sliderlist.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      secondsliderlist[index],
                      fit: BoxFit.fill,
                    )
                        .box
                        .rounded
                        .clip(Clip.antiAlias)
                        .margin(const EdgeInsets.symmetric(horizontal: 10))
                        .make();
                  }),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    3,
                    (index) => homeButton(
                          width: context.width / 3.5,
                          height: context.screenHeight * 0.15,
                          icon: index == 0
                              ? icTopCategories
                              : index == 1
                                  ? icTopSeller
                                  : icBrands,
                          title: index == 0
                              ? topcategory
                              : index == 1
                                  ? topseller
                                  : brand,
                        )),
              ),
              20.heightBox,
              Align(
                  alignment: Alignment.bottomLeft,
                  child: featurecategory.text
                      .color(darkFontGrey)
                      .size(18)
                      .fontFamily(semibold)
                      .make()),
                      20.heightBox,
                     SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                       child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                     children: List.generate(
                                         3,
                                         (index) => Column(
                        children: [
                          featureButton(icon: featuredlist1[index],title: featuredtitle1[index]),
                          10.heightBox,
                          featureButton(icon: featuredlist2[index],title: featuredtitle2[index])
                        ],
                                         ),
                                         ),
                                   ),
                     ),
                     20.heightBox,
                     GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 8,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 ,mainAxisSpacing: 8, crossAxisSpacing: 8,mainAxisExtent: 300), itemBuilder:((context, index) {
                       return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Image.asset(imgP1 ,height: 200, width: 200, fit: BoxFit.fill,),
                        const Spacer(),
                        "Laptop".text.fontFamily(semibold).color(darkFontGrey).make(),
                        10.heightBox,
                         "\$500".text.fontFamily(semibold).color(redColor).make()
                        
                        ]
                       ).box.white.margin(const EdgeInsets.symmetric( horizontal:4,)).roundedSM.padding(EdgeInsets.all(8)).height(300).make();
                     }))
                      ],
             ),
           ),
         )
        ],
      )),
    );
  }
}
