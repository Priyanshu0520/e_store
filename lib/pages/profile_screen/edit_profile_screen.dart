import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../consts/colors.dart';
import '../../consts/images.dart';
import '../../controller/profilecontroller.dart';
import '../../widget_common/bg_widget.dart';
import '../../widget_common/ourButton.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    return bgWidget(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                5.heightBox,
                controller.profileimgPath.isEmpty
                    ? Image.asset(
                        imgProfile2,
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    : Image.file(
                        File(controller.profileimgPath.value),
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make(),
                ourButton(
                    color: yellow,
                    onPress: () {
                      Get.find<ProfileController>().changeImage(context);
                    },
                    textColor: black,
                    title: "Change"),
                Divider(),
                20.heightBox,
                Container(
                  width: 250,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(),
                            filled: true,
                            fillColor: white,
                            labelText: "Name",
                            hintText: "Name",
                            hintStyle: TextStyle(color: textfieldGrey)),
                      ),
                      20.heightBox,
                      TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(),
                            labelText: "Password",
                            filled: true,
                            fillColor: white,
                            hintText: "Password",
                            hintStyle: TextStyle(color: textfieldGrey)),
                      ),
                    ],
                  ),
                ),
                10.heightBox,
                SizedBox(
                  width: context.screenWidth - 150,
                  child: ourButton(
                      color: yellow,
                      onPress: () {},
                      textColor: black,
                      title: "Save"),
                )
              ],
            ),
          )
              .box
              .white
              .rounded
              .width(context.screenWidth - 50)
              .shadowMd
              .padding(EdgeInsets.all(16))
              .makeCentered()),
    );
  }
}
