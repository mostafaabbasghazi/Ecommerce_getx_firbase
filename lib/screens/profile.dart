import 'dart:io';


import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebaseecom/constant/colors.dart';
import 'package:firebaseecom/controller/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller=Get.put(ProfileController());
    return GetBuilder<ProfileController>(builder: (controller){
      return Scaffold(
        backgroundColor: AppColor.grey,
      appBar: AppBar(
        title: Text("Profile",style: TextStyle(fontSize: 30,),),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child:Center(
          child:  ListView(
            children: [
           CircleAvatar(
            radius: 80,
            backgroundColor: Colors.grey,
            backgroundImage:  controller.userImage != null
                ? NetworkImage(controller.userImage.value )
                : null,
          ),SizedBox(height: 20,),
          Center(child: Text(controller.userEmail.value,style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),),
        SizedBox(height: 20,),
        Divider(
          color: Colors.black,
          thickness: 2.0,

        ),
        SizedBox(height: 20,),


            ],
          )
        )
      ),
    );
    });
  }
}