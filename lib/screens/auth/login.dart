
import 'package:firebaseecom/constant/routs_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebaseecom/controller/auth/login.dart';

import '../../constant/colors.dart';
import '../../function/vaildate.dart';
import '../widget/custtom_text_field.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller=Get.put(LoginController());
    return GetBuilder<LoginController>(builder: (controller){
      return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login",style: TextStyle(fontSize: 30),),),
      //backgroundColor: Color(0xf2f2f2f2),
      body:  Container(
        child: ListView(children: [
          Image.asset("images/logo.png",width: MediaQuery.of(context).size.width/2,height: 300,),
          Container(
            margin: EdgeInsets.all(20),
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
              SizedBox(height: 20,),
              CustomTextForm(
                hinttext:"Enter Your Password" ,
                labeltext: "Passwrd",
                iconData: Icons.password_outlined,
                mycontroller: controller.password,
                isNumber: false,
                valid: (value) {
                  return validInput(value!, 3, 20, "password");
                },
                ),
            SizedBox(height: 20,),
            controller.isLoading==false?
                        InkWell(
              onTap: (){
                controller.signIn();
              },
              child:Container(
              padding: EdgeInsets.all(6),
              width: MediaQuery.of(context).size.width,
              //margin: EdgeInsets.only(left: 40,right: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.redAccent
              ),
              child: Center(
                child: Text("Login",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),)
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
            Get.offNamed(AppRout.signUp);
          },
          child: Text("SignUp",
              style: const TextStyle(
                  color: AppColor.primaryColor, fontWeight: FontWeight.bold)),
        )
      ],
    ),SizedBox(height: 10,),
    InkWell(
      onTap: () {
        Get.offAllNamed(AppRout.forgetPassword);
      },
      child: Center(child: Text("Forget PAssword",style:TextStyle(fontSize: 15,color: Colors.redAccent)),),),
      SizedBox(height: 10,),
    InkWell(
      onTap: () {
        Get.toNamed(AppRout.adminLogin);
      },
      child: Center(child: Text("admin login",style:TextStyle(fontSize: 15,color: Colors.redAccent)),),)
          ],)),)
        ],),
      ),
    );
    });
  }
}