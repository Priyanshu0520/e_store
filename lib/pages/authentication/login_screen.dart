// // ignore_for_file: prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:velocity_x/velocity_x.dart';
// import '../../consts/colors.dart';
// import '../../consts/lists.dart';
// import '../../consts/strings.dart';
// import '../../consts/styles.dart';
// import '../../widget_common/applogo_widget.dart';
// import '../../widget_common/bg_widget.dart';
// import '../../widget_common/custom_textfield.dart';
// import '../../widget_common/ourButton.dart';
// import '../home/home.dart';
// import 'signup_screen.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
    

//  var  controller = Get.put(AuthController());

//     return bgWidget(
//         child: Scaffold(
//       body: Center(
//           child: SingleChildScrollView(
//             child: Column(
//                   children: [
//             (6).heightBox,
//             applogowidget(),
            
//             "Log in to $appname".text.fontFamily(bold).size(20).make(),
//             10.heightBox,
//             Column(
//               children: [
//                customTextField(hint: emailHint, title: email , isPass: false , controller: controller.emailController),
//                  customTextField(hint: passwordHint, title: password ,isPass: true , controller: controller.passwordController),
                
//                 Align(
//                     alignment: Alignment.centerRight,
//                     child: TextButton(
//                         onPressed: () {}, child: forgetpass.text.make())),
//                 10.heightBox,
//                 // ourButton().box.width(context.screenWidth-50).make(),
//                 ourButton(
//                         color: yellow,
//                         title: login,
//                         textColor: black,
//                         onPress: () async  {
//                          await controller.loginMethod(context: context).then((value) {
//                           if(value!= null){
//                             VxToast.show(context, msg: loggedin);
//                             Get.offAll(()=> Home());
//                           }
//                          });
//                         })
//                     .box
//                     .width(context.screenWidth-50)
//                     .make(),
//                     5.heightBox
//                     ,
//             createnewaccount.text.color(fontGrey).make(),
//             5.heightBox,
//             ourButton(
//                     color: lightgolden, title: signup, textColor: black, onPress: () {
//                       Get.to(()=>Signup());
//                     })
//                 .box
//                 .width(context.screenWidth-50)
//                 .make(),
//                 10.heightBox,
//                 loginWith.text.color(fontGrey).make(),
//                 5.heightBox,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: 
//                     List.generate(3, (index) => Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: CircleAvatar(
//                         backgroundColor: lightGrey,
//                         radius: 22,
//                         child:Image.asset(socialiconlist[index], width: 30,)
//                       ),
//                     ))
//                   ,
//                 )
//               ],
//             )
//                 .box
//                 .white
//                 .shadowSm
//                 .rounded
//                 .padding(EdgeInsets.all(16))
//                 .width(context.screenWidth - 50)
//                 .make(),
                
            
//                   ],
//                 ),
//           )),
//     ));
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/consts/colors.dart';
import 'package:e_store/pages/home/home.dart';
import 'package:e_store/widget_common/bg_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';


import '../../consts/consts.dart';
import '../../consts/lists.dart';
import '../../consts/strings.dart';
import '../../widget_common/applogo_widget.dart';
import '../../widget_common/custom_textfield.dart';
import '../../widget_common/ourButton.dart';
import '../../widget_common/toptile.dart';
import 'signup_screen.dart';

class Login extends StatefulWidget {
  
 Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
   bool isLoading=false;
  late UserCredential authResult;
  void submit() async{
    setState(() {
      isLoading=true;
    });
    try{
       authResult=await FirebaseAuth.instance.signInWithEmailAndPassword(email:email.text, password:password.text);
         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>Home()));
    setState(() {
      isLoading=false;
    });
    }
    on PlatformException catch(e){
      String message="Please check interner";
      if(e.message!=null)
      {
      message=e.message.toString();
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message.toString())));
      setState(() {
        isLoading=false;
      });
      
    }
    catch(e)
    {
      setState(() {
        isLoading=false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  
  }
  
  final TextEditingController email=TextEditingController();

   final TextEditingController password=TextEditingController();

   final GlobalKey<ScaffoldState> scaffold=GlobalKey<ScaffoldState>();

   void validation(context){
    if(email.text.isEmpty){
     const snackBar = SnackBar(
  content: Text('Email is Empty!'),
);
ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    
   else if(!RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email.text)){
          const snackBar = SnackBar(
  content: Text('Not a valid Email!'),

);
ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    else if(password.text.isEmpty){
     const snackBar = SnackBar(
  content: Text('Password is Empty!'),

);
ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else if(password.text.length<8){
     const snackBar = SnackBar(
  content: Text('Minimum length of password should be 8'),


);
ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else{
      submit();
    }
    
  
   }

  @override
  Widget build(BuildContext context) {
    
    return bgWidget(
      child: Scaffold(
    
        body: SingleChildScrollView(
          child: Column(
            children: [
            applogowidget(),
         "Login to $appname".text.fontFamily(bold).size(20).make(),
         10.heightBox,
           Column(
                children: [
               
          
          
                  customTextField(hint: "Email", isPass: false ,title: "Email", controller: email),
             customTextField(hint: "Password",isPass: true, title: "Email", controller: password),
              Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {}, child: forgetpass.text.make())),
            10.heightBox
           ,
           
              ourButton(
                    color: yellow,
                    title: login,
                    textColor: black,
                      onPress:()async {
                        
                        
                 validation(context);
        
                },) .box
                .width(context.screenWidth-50)
                .make(),
                
                      5.heightBox
                ,
          createnewaccount.text.color(fontGrey).make(),
          5.heightBox,
          ourButton(
                color: lightgolden, title: signup, textColor: black, onPress: () {
                  Get.to(()=>SignUp());
                })
            .box
            .width(context.screenWidth-50)
            .make(),
            10.heightBox,
            loginWith.text.color(fontGrey).make(),
            5.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: 
                List.generate(3, (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: lightGrey,
                    radius: 22,
                    child:Image.asset(socialiconlist[index], width: 30,)
                  ),
                ))
              ,
            )
                     
                ],
              ) .box
            .white
            .shadowSm
            .rounded
            .padding(EdgeInsets.all(16))
            .width(context.screenWidth - 50)
            .makeCentered(),
            
            ],
          ),
        ),
      ),
    );
  }
}