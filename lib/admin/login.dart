
import 'package:firebaseecom/controller/admin/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminLogin extends StatelessWidget {
  const AdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    LoginAdminController controller =Get.put(LoginAdminController());
    return GetBuilder<LoginAdminController>(builder: (controller){
      return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: Text("Admin Login",style: TextStyle(fontSize: 30),),),
      backgroundColor: Color(0xf2f2f2f2),
      body:  Container(
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
              SizedBox(height: 30,),
            
            TextFormField(
              validator: (value) {
                if(value!.isEmpty && value!.length <5){
                  return "Password is Empty or length less than 5";
                }
              },
              controller: controller.password,
                keyboardType: TextInputType.visiblePassword,
                
              
              decoration: InputDecoration(
            hintText: "Enter Your Password",
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text("Password")),
            
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
                
            ),
            SizedBox(height: 40,),
            InkWell(
              onTap: (){
                controller.SignIn();
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
                child: Text("Login",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),)
            ),
            )
          ],)),)
        ],),
      ),
    );
    });
  }
}