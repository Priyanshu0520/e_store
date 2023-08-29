// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'dart:ui';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:velocity_x/velocity_x.dart';

// import '../../consts/colors.dart';
// import '../../consts/firebase_const.dart';
// import '../../consts/lists.dart';
// import '../../consts/strings.dart';
// import '../../consts/styles.dart';
// import '../../controller/auth_controller.dart';
// import '../../widget_common/applogo_widget.dart';
// import '../../widget_common/bg_widget.dart';
// import '../../widget_common/custom_textfield.dart';
// import '../../widget_common/ourButton.dart';
// import '../home/home.dart';
// import 'signup_screen.dart';

// class Signup extends StatefulWidget {
//   const Signup({super.key});

//   @override
//   State<Signup> createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   bool? isCheck = false;
//   var controller = Get.put(AuthController());

//   //textcontroler

//   var nameController = TextEditingController();
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();
//   var passwordRetypeController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return bgWidget(
//         child: Scaffold(
//       body: Center(
//           child: SingleChildScrollView(
//         child: Column(
//           children: [
//             (20).heightBox,
//             applogowidget(),
//             "Sign up to $appname".text.fontFamily(bold).size(20).make(),
//             10.heightBox,
//             Column(
//               children: [
//                 customTextField(
//                     hint: namehint,
//                     title: name,
//                     controller: nameController,
//                     isPass: false),
//                 customTextField(
//                     hint: emailHint,
//                     title: email,
//                     controller: emailController,
//                     isPass: false),
//                 customTextField(
//                     hint: passwordHint,
//                     title: password,
//                     controller: passwordController,
//                     isPass: true),
//                 customTextField(
//                     hint: passwordHint,
//                     title: retyprePassword,
//                     controller: passwordRetypeController,
//                     isPass: true),
//                 Align(
//                     alignment: Alignment.centerRight,
//                     child: TextButton(
//                         onPressed: () {}, child: forgetpass.text.make())),
//                 5.heightBox,
//                 // ourButton().box.width(context.screenWidth-50).make()

//                 Row(
//                   children: [
//                     Checkbox(
//                         checkColor: white,
//                         activeColor: redColor,
//                         value: isCheck,
//                         onChanged: (newValue) {
//                           setState(() {
//                             isCheck = newValue;
//                           });
//                         }),
//                     10.widthBox,
//                     Expanded(
//                       child: RichText(
//                           text: TextSpan(children: [
//                         TextSpan(
//                             text: "I agree to the ",
//                             style:
//                                 TextStyle(fontFamily: bold, color: fontGrey)),
//                         TextSpan(
//                             text: termandcondition,
//                             style:
//                                 TextStyle(fontFamily: bold, color: redColor)),
//                         TextSpan(
//                             text: " & ",
//                             style:
//                                 TextStyle(fontFamily: bold, color: fontGrey)),
//                         TextSpan(
//                             text: privacypolicy,
//                             style: TextStyle(fontFamily: bold, color: redColor))
//                       ])),
//                     )
//                   ],
//                 ),
//                 5.heightBox,
//                 ourButton(
//                     color: isCheck == true ? yellow : lightGrey,
//                     title: signup,
//                     textColor: black,
//                     onPress: () async {
//                       if (isCheck == true) {
//                         try {
//                           await controller
//                               .signupMethod(
//                                   context: context,
//                                   email: emailController.text,
//                                   password: passwordController.text)
//                               .then((value) {
//                             return controller.storeUserData(
//                               email: emailController.text,
//                               password: passwordController.text,
//                               name: nameController.text,
//                             );
//                           }).then((value) {
//                             VxToast.show(context, msg: loggedin);
//                             Get.offAll(() => Home());
//                           });
//                         } catch (e) {

//                           //  VxToast.show(context, msg: e.toString());
//                         }
//                       }
//                     }).box.width(context.screenWidth - 50).make(),
//                 10.heightBox,
//                 RichText(
//                     text: TextSpan(children: [
//                   TextSpan(
//                       text: alreadyhaveacc,
//                       style: TextStyle(fontFamily: bold, color: fontGrey)),
//                   TextSpan(
//                       text: " ",
//                       style: TextStyle(fontFamily: bold, color: fontGrey)),
//                   TextSpan(
//                       text: login,
//                       style: TextStyle(fontFamily: bold, color: redColor))
//                 ])).onTap(() {
//                   Get.back();
//                 })
//               ],
//             )
//                 .box
//                 .white
//                 .shadowSm
//                 .rounded
//                 .padding(EdgeInsets.all(16))
//                 .width(context.screenWidth - 50)
//                 .make(),
//           ],
//         ),
//       )),
//     ));
//   }
// }

// class AuthController extends GetxController {
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();

//   Future<UserCredential?> loginMethod({email, password, context}) async {
//     UserCredential? userCredential;
//     try {
//       await auth.signInWithEmailAndPassword(
//           email: emailController.text, password: passwordController.text);
//     } on FirebaseAuthException catch (e) {
//       VxToast.show(context, msg: e.toString());
//     }
//     return userCredential;
//   }

//   Future<UserCredential?> signupMethod({email, password, context}) async {
//     UserCredential? userCredential;
//     try {
//       await auth.createUserWithEmailAndPassword(
//           email: emailController.text, password: passwordController.text);
//     } on FirebaseAuthException catch (e) {
//       VxToast.show(context, msg: e.toString());
//     }
//     return userCredential;
//   }

//   storeUserData({name, password, email}) async {
//     DocumentReference store =
//         firestore.collection(usersCollection).doc(currentUser!.uid);
//     store.set(
//         {'name': name, "password": password, "email": email, "imageUrl": ""});
//   }

//   signoutMethod(context) async {
//     try {
//       await auth.signOut();
//     } catch (e) {
//       VxToast.show(context, msg: e.toString());
//     }
//   }
// }

// ignore_for_file: nullable_type_in_catch_clause, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:e_store/widget_common/applogo_widget.dart';
import 'package:e_store/widget_common/bg_widget.dart';
import 'package:e_store/widget_common/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/consts.dart';
import '../../widget_common/ourButton.dart';
import '../../widget_common/toptile.dart';
import '../home/home.dart';
import 'login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool? isCheck = false;
  bool isLoading = false;
  late UserCredential authResult;
  void submit() async {
    setState(() {
      isLoading = true;
    });
    try {
      authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      VxToast.show(context, msg:e.toString());
    }
    await FirebaseFirestore.instance
        .collection("User")
        .doc(authResult.user!.uid)
        .set({
          "id":currentUser,
      "UserName": fullname.text,
      "UserEmail": email.text,
      "UserNumber": phoneNumber.text,
      "UserAddress": address.text,
      "UserPassword": password.text
    });
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => Home()));
    setState(() {
      isLoading = false;
    });
  }

  final TextEditingController email = TextEditingController();

  final TextEditingController fullname = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();

  final TextEditingController password = TextEditingController();
  final TextEditingController address = TextEditingController();
  void validation(context) {
    if (email.text.isEmpty) {
     VxToast.show(context, msg: "Please enter Email");
    } else if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email.text)) {
      VxToast.show(context, msg: "Not a Valid Email");
    } else if (password.text.isEmpty) {
    VxToast.show(context, msg: "Password is empty");
    } else if (fullname.text.isEmpty) {
     VxToast.show(context, msg: "Please enter your name");
    } else if (address.text.isEmpty) {
     VxToast.show(context, msg: "Address cannot be empty");
    } else if (phoneNumber.text.length != 10) {
      VxToast.show(context, msg: "enter valid Phonr number");
    } else if (password.text.length < 8) {
     VxToast.show(context, msg: "Password length must be 8 digit.");
    } else {
      submit();
    }
  }

//UI part

  @override
  Widget build(BuildContext context) {
  
    return bgWidget(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                applogowidget(),
                "SignUp $appname".text.fontFamily(bold).size(20).make(),
                10.heightBox,
                Column(
                  children: [
                    customTextField(
                        title: "FullName",
                        isPass: false,
                        hint: "Full name",
                        controller: fullname),
                    SizedBox(
                      height: 10,
                    ),
                    customTextField(
                        title: "Email",
                        isPass: false,
                        hint: "Email",
                        controller: email),
                    SizedBox(
                      height: 10,
                    ),
                    customTextField(
                        title: "Phone Number",
                        isPass: false,
                        hint: "Phone Num",
                        controller: phoneNumber),
                    SizedBox(
                      height: 10,
                    ),
                    customTextField(
                        title: "Address",
                        isPass: false,
                        hint: "Address",
                        controller: address),
                    SizedBox(
                      height: 10,
                    ),
                    customTextField(
                        title: "Password",
                        isPass: true,
                        hint: "Password",
                        controller: password),
                        Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgetpass.text.make().onTap(() {}))),
                5.heightBox,
                         // ourButton().box.width(context.screenWidth-50).make()

                Row(
                  children: [
                    Checkbox(
                        checkColor: white,
                        activeColor: redColor,
                        value: isCheck,
                        onChanged: (newValue) {
                          setState(() {
                            isCheck = newValue;
                          });
                        }),
                    10.widthBox,
                    Expanded(
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "I agree to the ",
                            style:
                                TextStyle(fontFamily: bold, color: fontGrey)),
                        TextSpan(
                            text: termandcondition,
                            style:
                                TextStyle(fontFamily: bold, color: redColor)),
                        TextSpan(
                            text: " & ",
                            style:
                                TextStyle(fontFamily: bold, color: fontGrey)),
                        TextSpan(
                            text: privacypolicy,
                            style: TextStyle(fontFamily: bold, color: redColor))
                      ])),
                    )
                  ],
                ),
                5.heightBox,
                        ourButton(
                          
                         color: isCheck == true ? yellow : lightGrey,
                         title: signup,
                         textColor: black,
                         onPress: () async {
                           if (isCheck == true) {
                             try {
                               validation(context);
                             } catch (e) {}
                             ;
                           }
                         },
                                          ).box.width(context.screenWidth - 50).make(),

                  RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: alreadyhaveacc,
                      style: TextStyle(fontFamily: bold, color: fontGrey)),
                  TextSpan(
                      text: " ",
                      style: TextStyle(fontFamily: bold, color: fontGrey)),
                  TextSpan(
                      text: login,
                      style: TextStyle(fontFamily: bold, color: redColor))
                ])).onTap(() {
                  Get.back();
                })
                  
                  ],
                )
                    .box
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
      ),
    );
  }
}
