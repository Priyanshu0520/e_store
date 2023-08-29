
import 'package:flutter/material.dart';

import '../../consts/images.dart';

Widget bgWidget({Widget? child}){
  
  return Center(
    child: Container(
      
      decoration: BoxDecoration(
        
        image:  DecorationImage(image : AssetImage(imgBackground,),fit: BoxFit.fill
        )
      ),
      child: child,
    ),
  );

}