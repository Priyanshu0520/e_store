import 'package:flutter/material.dart';

class Toptitle extends StatelessWidget {
  final title,subtitle;
  Toptitle({required this.title,required this.subtitle});

  @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
double screenHeight = MediaQuery.of(context).size.height;
    return  Container(
                 // color: Colors.blue,
                 padding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                  height: screenHeight/4,
                  width: screenWidth/1.08,
                  child: Column(
                   // mainAxisAlignment: MainAxisAlignment.start, 
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,style: TextStyle(
                        fontSize: 40,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold
                      ),),
                     
                      Text(subtitle,style: TextStyle(
                        fontSize: 32,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400
                      ),)
                    ],
                  ),
                );
  }
}