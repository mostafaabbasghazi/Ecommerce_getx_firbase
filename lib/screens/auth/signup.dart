import 'dart:io';

import 'package:firebaseecom/constant/routs_name.dart';
import 'package:firebaseecom/controller/auth/signup.dart';
import 'package:firebaseecom/function/vaildate.dart';
import 'package:firebaseecom/screens/widget/custtom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../constant/colors.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController controller =Get.put(SignUpController());
    return GetBuilder<SignUpController>(builder: (controller){
      return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text("SignUp",style: TextStyle(fontSize: 30),),),
      backgroundColor: Color(0xf2f2f2f2),
      body: Container(
        margin: EdgeInsets.all(20),
        child: ListView(children: [
            SizedBox(height: 20,),
            CircleAvatar(
            radius: 100,
            backgroundColor: Colors.grey,
            backgroundImage:  controller.fileSelect != null
                ? FileImage(controller.fileSelect as File,)
                : null,
          ),
          TextButton.icon(
            onPressed: controller.getImage,
            icon: const Icon(Icons.image),
            label: const Text('Add Image'),),
            SizedBox(height: 10,),
            Divider(height: 3,color: Colors.black,thickness: 3,),
            SizedBox(height: 30,),
          Container(
            margin: EdgeInsets.all(10),
            child: Form(
              key: controller.globalKey,
              child: Column(children: [
           CustomTextForm(
                hinttext:"Enter Your email" ,
                labeltext: "Email",
                iconData: Icons.email_outlined,
                mycontroller: controller.email,
                isNumber: false,
                valid: (value) {
                  return validInput(value!, 3, 300, "email");
                },
                ),
              SizedBox(height: 30,),
                CustomTextForm(
                hinttext:"Enter Your UserName" ,
                labeltext: "UserName",
                iconData: Icons.verified_user_outlined,
                mycontroller: controller.name,
                isNumber: false,
                valid: (value) {
                  return validInput(value!, 3, 20, "username");
                },
                ),
              SizedBox(height: 30,),
              CustomTextForm(
                hinttext:"Enter Your Password" ,
                labeltext: "password",
                iconData: Icons.remove_red_eye_outlined,
                mycontroller: controller.password,
                isNumber: false,
                valid: (value) {
                  return validInput(value!, 3, 20, "password");
                },
                ),
              SizedBox(height: 30,),
                CustomTextForm(
                hinttext:"Enter Your Adress" ,
                labeltext: "Adress",
                iconData: Icons.location_history_outlined,
                mycontroller: controller.address,
                isNumber: false,
                valid: (value) {
                  return validInput(value!, 3, 20, "");
                },
                ),
                SizedBox(height: 30,),
                CustomTextForm(
                hinttext:"Enter Your Post Number" ,
                labeltext: "Post Number",
                iconData: Icons.numbers_outlined,
                mycontroller: controller.postNumber,
                isNumber: true,
                valid: (value) {
                  return validInput(value!, 3, 20, "");
                },
                ),
            SizedBox(height: 40,),
            controller.isLoading==false?InkWell(
            onTap: (){
              controller.signUp();
            },
            child:  Container(
              padding: EdgeInsets.all(6),
              width: MediaQuery.of(context).size.width,
              //margin: EdgeInsets.only(left: 40,right: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.redAccent
              ),
              child: Center(
                child: Text("Create Account",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),)
            ),
           ):Center(child: CircularProgressIndicator(color: Colors.redAccent,),),
           SizedBox( height:20),
            Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("go to "),
        InkWell(
          onTap: (){
            Get.offNamed(AppRout.login);
          },
          child: Text("Login",
              style: const TextStyle(
                  color: AppColor.primaryColor, fontWeight: FontWeight.bold)),
        )
      ],
    )
          ],)),)
        ],),
      ),
    );
    });
  }
}