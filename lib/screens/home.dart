import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebaseecom/constant/colors.dart';
import 'package:firebaseecom/constant/routs_name.dart';
import 'package:firebaseecom/controller/pages/home.dart';
import 'package:firebaseecom/screens/cat_products.dart';
import 'package:firebaseecom/screens/product_deatails.dart';
import 'package:firebaseecom/screens/widget/home/category_list.dart';
import 'package:firebaseecom/screens/widget/home/product_list.dart';
import 'package:firebaseecom/screens/widget/search_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/home/custtomcard.dart';


class Home extends StatelessWidget{
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller =Get.put(HomeController());
    return GetBuilder<HomeController>(builder: (controller){
      return  Scaffold(
      backgroundColor:AppColor.grey,
      body: Container(
        margin: EdgeInsets.only(top: 50,left: 20,right: 20.0),
        child: ListView(
         
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [ Text(controller.userName,style: TextStyle(color: Colors.black,fontSize: 28,fontWeight: FontWeight.bold),
            ),
             Text("Good Morning",style: TextStyle(color: Colors.black54,fontSize: 20,fontWeight: FontWeight.w400))
            
            ],),
               
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(controller.userImage.value,height: 70,width: 70,fit: BoxFit.cover,filterQuality: FilterQuality.high,),
            )
              ],
            ),
            SizedBox(height: 20,),
            
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
              width: MediaQuery.of(context).size.width,
              child: TextField(
                onChanged: (value){
                  controller.getSearchItems(value);
                },
                decoration: InputDecoration(
                  hintText: "Search Product",
                  hintStyle: TextStyle(fontSize: 20,),
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.search,size: 30,)
                  
                ),
              ),
            ),
            controller.searchItems.isEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              CustomCardHome(
                                  title: "A summer surprise",
                                  body: "Cashback 20%"),
                             
                            ],
                          )
                        : SearchResult(products: controller.searchItems),
        
            SizedBox(height: 20,),
            
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("Categories",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),)
            ],),
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 200,
              child: Category()),
              SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("For You",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),)
              ,InkWell(
                onTap: (){
                  Get.toNamed(AppRout.seeAllDiscount);
                },
                child: Text("see all",style: TextStyle(color: Colors.redAccent,fontSize: 17,fontWeight: FontWeight.bold),),)
            ],),
            SizedBox(height: 20,),
           GetBuilder<HomeController>(builder: (controllerr){
            return  Container(
              margin: EdgeInsets.only(left: 20),
              height: 260,
              child:Products()
            );
           })
           
          ],
        ),
      ),
    );
    });
  }
}