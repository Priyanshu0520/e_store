import 'package:e_store/pages/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



import 'package:velocity_x/velocity_x.dart';


import '../../consts/consts.dart';

import '../authentication/signup_screen.dart';
import '../home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    
   changeScreen();
   super.initState();
  }
  changeScreen(){
    Future.delayed(Duration(seconds: 3),(){
Get.to(()=>Home());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 170),
              child: Image.asset(icAppLogo),
            ),
            100.heightBox,
           
         
            appversion.text.size(10).black.make(),
            Spacer(),
            credits.text.black.fontFamily(semibold).make(),
            30.heightBox
          ],
        ),
      )
    );
  }
}