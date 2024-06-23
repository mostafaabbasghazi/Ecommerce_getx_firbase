
import 'package:firebaseecom/constant/routs_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text("Admin Panel",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
      body: Container(
        margin: const EdgeInsets.only(top: 70,left: 20,right: 20),
        child: ListView(
          children: [
            InkWell(
              onTap: (){
                Get.toNamed(AppRout.addCategory);
              },
              child:Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.redAccent,borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width,
                child: const Center(child: Text("Add Category",style: TextStyle(fontSize: 20,color: Colors.white),),)
              ),
            ),const SizedBox(height: 30,),
            InkWell(
              onTap: (){
                Get.toNamed(AppRout.addProduct);
              },
              child:Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.redAccent,borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width,
                child: const Center(child: Text("Add Product",style: TextStyle(fontSize: 20,color: Colors.white),),)
              ),
            ),const SizedBox(height: 30,),
            InkWell(
              onTap: (){
                Get.toNamed(AppRout.show_category);
              },
              child:Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.redAccent,borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width,
                child: const Center(child: Text("All Categories",style: TextStyle(fontSize: 20,color: Colors.white),),)
              ),
            ),const SizedBox(height: 30,),
            InkWell(
              onTap: (){
                Get.toNamed(AppRout.show_products);
              },
              child:Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.redAccent,borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width,
                child: const Center(child: Text("All Products",style: TextStyle(fontSize: 20,color: Colors.white),),)
              ),
            ),const SizedBox(height: 30,),
            InkWell(
              child:Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.redAccent,borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width,
                child: const Center(child: Text("All Users",style: TextStyle(fontSize: 20,color: Colors.white),),)
              ),
            ),
            const SizedBox(height: 30,),
            InkWell(
              child:Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.redAccent,borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width,
                child: const Center(child: Text("Orders",style: TextStyle(fontSize: 20,color: Colors.white),),)
              ),
            ),const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}