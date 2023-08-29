// ignore_for_file: prefer_const_constructors

import 'package:e_store/consts/lists.dart';
import 'package:e_store/controller/profilecontroller.dart';
import 'package:e_store/pages/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../consts/colors.dart';
import '../../consts/images.dart';
import '../../consts/styles.dart';

import '../../widget_common/bg_widget.dart';
import '../authentication/signup_screen.dart';
import 'components/details_cards.dart';
import 'edit_profile_screen.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
      
        body: SafeArea(child: Container(
          padding:EdgeInsets.all(8),
          child: Column(
            children:[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  
                  alignment: Alignment.topRight,
                  child: InkWell(
                    child: Icon(Icons.edit, color:black, 
                                 
                    ).onTap(() {Get.to(()=>EditProfileScreen());
                    })
                  )),
              ),
              Row(
                children: [
                  Image.asset(imgProfile2, width: 100,fit:BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Dummy User".text.fontFamily(semibold).black.make(),
                     
                      "preeetgupta1213@gmail.com ".text.black.make(),
                    ],
                  )),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color:black
                      )
                    ),
                    onPressed: ()async {
                    //  await Get.put(AuthController()).signoutMethod(context);
                     Get.offAll(()=>Login());
                    },
                    child: "logout".text.black.make())
                ],
             
              ),
              15.heightBox,
    
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  detailsCard(count:"00", title:"in your cart", width: context.screenWidth/3.2),
                  detailsCard(count:"32", title:"in your wishlist", width: context.screenWidth/3.2),
                  detailsCard(count:"555", title:"your orders", width: context.screenWidth/3.2),
                ],
              ),
               10.heightBox,
               Row(
      children: <Widget>[
          Expanded(
              child: Divider(
                color: Colors.black,
                        height: 50,
              )
          ), 
        
      ]
    ),
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: lightGrey,
                  );
                },
                itemCount: profilebuttonList.length,
                itemBuilder: (BuildContext context ,int index){
                  return ListTile(
                    leading: Image.asset(profileButtoIcons[index], width: 22,),
                    title: profilebuttonList[index].text.color(black).make(),
                  );
                },
                ).box.color(Colors.white).rounded.padding( const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make(),
          
            ],
          )
        )),
      ),
    );
  }
}