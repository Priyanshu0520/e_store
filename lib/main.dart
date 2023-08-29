
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import 'consts/consts.dart';
import 'pages/splash_screen/splashscreen.dart';



void main() async {

  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    
  );
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  void initState(){
    SplashScreen();
    
  }
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ScreenUtilInit(builder: (context, child) {
      return GetMaterialApp(
        title: 'E-store',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
           
            iconTheme: IconThemeData(
            color: darkFontGrey
          ),
          ),
          scaffoldBackgroundColor: Colors.transparent,
         
        ),
        debugShowCheckedModeBanner: false,
        
        
        home: SplashScreen()
      );
    });
  }
}
