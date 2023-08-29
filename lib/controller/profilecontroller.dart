import 'dart:io';


import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileController extends GetxController{
  var profileimgPath = ''.obs;

  changeImage(context)async{
   try{
     final img = await ImagePicker().pickImage(source: ImageSource.gallery , imageQuality: 70);
    if(img==null)return;
    profileimgPath.value = img.path;
   }  catch (e){
   VxToast.show(context , msg: e.toString());
   }
  }
}