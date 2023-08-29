
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/home/home.dart';






class UserInfoController extends GetxController {
  var getusername = TextEditingController().obs;
  var getuserlastname = TextEditingController().obs;
  var loading = false.obs;
  submit(var phonenumber, var id, var auth) {
    if (getuserlastname.value.text.isEmpty || getusername.value.text.isEmpty) {
      Get.rawSnackbar(
          title: "Please Enter all the details",
          message: "",
          messageText: const Text(""));
    } else {
      loading.value = true;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      User? user = auth.currentUser;

      try {
        CollectionReference userss = firebaseFirestore.collection("Users");
        userss.doc(user!.uid).set({
          "FirstName": getusername.value.text.toString(),
          "LastName": getuserlastname.value.text.toString(),
          "Age": 0,
          "Gender": "",
          "CartPrice": 0.0,
          "City": "",
          "Pincode": "",
          "Address": "",
          "UserIds": user.uid,
          "PhoneNumber": user.phoneNumber,
          "Email": " ",
          "Wishlist": "",
          "CartList": ""
        }).then((value) {
          user.updateDisplayName(getusername.value.text.toString());
          loading.value = false;
          Get.offAll(() => Home());
        });
      } on FirebaseException catch (e) {
        loading.value = true;
        Get.rawSnackbar(title: e.code);
        FirebaseAuth auth = FirebaseAuth.instance;
        auth.signOut().then((value) => user!.delete());

        print(e);
      }
    }
  }

  Future<bool> deleteonback() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    user!.delete().then((value) {
      return true;
    });

    return false;
  }
}
