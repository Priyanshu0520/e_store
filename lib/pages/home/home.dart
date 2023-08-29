
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../consts/images.dart';
import '../../consts/strings.dart';
import '../../controller/homecontroller.dart';
import '../cart_screen/cart.dart';
import '../categories_screen/category_screen.dart';
import '../profile_screen/profile_screen.dart';
import 'home_screen/home_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

  var navbarItem =[
  BottomNavigationBarItem(icon: Image.asset(icHome , width:26), label:home ),
  BottomNavigationBarItem(icon: Image.asset(icCategories , width:26), label:categories ),
  BottomNavigationBarItem(icon: Image.asset(icCart , width:26), label:cart ),
  BottomNavigationBarItem(icon: Image.asset(icProfile , width:26), label:account)];
  var navBody =[
   HomeScreen(),
   CategoryScreen(),
   CartScreen(),
   ProfileScreen()
  ];
  
    return Scaffold(
      body: Column(
        children: [
          Obx(()=> Expanded(child: navBody.elementAt(controller.currentNavIndex.value))),
        ],
      ),
      bottomNavigationBar: Obx(()=>
        BottomNavigationBar(
          onTap: (value){
            controller.currentNavIndex.value = value;
          },
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: redColor,
          selectedLabelStyle: TextStyle(fontFamily: semibold),
          type: BottomNavigationBarType.fixed,
          backgroundColor: white,
          items: navbarItem),
      ),
    );
  }
}