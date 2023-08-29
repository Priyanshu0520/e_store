import 'package:e_store/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';



class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : "Title".text.fontFamily(semibold).make()
      ),
      body: Padding(padding: EdgeInsets.all(8),
      child: Column(
        children: [Expanded(child: Container())],
      ),
      ),
    );

}
}