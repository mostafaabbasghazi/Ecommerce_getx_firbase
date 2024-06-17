
import 'package:firebaseecom/constant/routs_name.dart';
import 'package:firebaseecom/controller/auth/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebaseecom/controller/auth/login.dart';

import '../../constant/colors.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordController controller=Get.put(ForgetPasswordController());
    return GetBuilder<ForgetPasswordController>(builder: (controller){
      return  Scaffold(
      appBar: AppBar(title: Text("Login",style: TextStyle(fontSize: 30),),),
      //backgroundColor: Color(0xf2f2f2f2),
      body: Container(
        child: ListView(children: [
          Image.asset("images/logo.png",width: MediaQuery.of(context).size.width/2,height: 300,),
          Container(
            margin: EdgeInsets.all(20),
            child: Form(
              key: controller.globalKey,
              child: Column(children: [
            TextFormField(
              validator: (value) {
                if(value!.isEmpty && value!.length <5){
                  return "Email is Empty or length less than 5";
                }
              },
              controller: controller.email,
              keyboardType: TextInputType.emailAddress,
              
              decoration: InputDecoration(
               hintText: "Enter Your Email",
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text("Email")),
            
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
                
              ),
            
            SizedBox(height: 40,),
            controller.isLoading==false?
                        InkWell(
              onTap: (){
                controller.reCoverPassword();
              },
              child:Container(
              padding: EdgeInsets.all(6),
              width: MediaQuery.of(context).size.width,
              //margin: EdgeInsets.only(left: 40,right: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.redAccent
              ),
              child: Center(
                child: Text("Send Password",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),)
            ),
            ):Center(
              child: CircularProgressIndicator(color: Colors.redAccent,),
            ),
            SizedBox(height: 20,),
             Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("go to "),
        InkWell(
          onTap: (){
            Get.offNamed(AppRout.login);
          },
          child: Text("login",
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