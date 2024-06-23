import 'package:cached_network_image/cached_network_image.dart';
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
        margin: EdgeInsets.only(top: 30,left: 20,right: 20.0),
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
                controller: controller.search,
                onChanged: (value){
                  controller.checkSearch(value);
                },
                decoration: InputDecoration(
                  hintText: "Search Product",
                  hintStyle: TextStyle(fontSize: 20,),
                  border:InputBorder.none,
                  prefixIcon: IconButton(icon:Icon(Icons.search,size: 30),onPressed:(){
                    controller.onSearchItems();
                  })
                  
                ),
              ),
            ),
            !controller.isSearch? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
            
            
                         Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              CustomCardHome(
                                  title: "A summer surprise",
                                  body: "Cashback 20%"),
                             
                            ],
                          ),
                         
        
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
           ] ,):SearchResult(products: controller.searchItems),
           
          ],
        ),
      ),
    );
    });
  }
}
//SearchResult(products: controller.searchItems),
class SearchResult extends StatelessWidget {
  final List products;
  const SearchResult({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:ListView.builder(
       shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: products.length,
        itemBuilder: (context,index) {
          return Card(
            
            margin: EdgeInsets.only(top: 30),
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Row(
          children: [
          
          Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: products[index]["imageLink"],
                height: 80,
              )),
          
         
               Expanded(
                flex: 1,
                child: InkWell(
                            onTap: (){
                              Get.to(()=>ProductDeatails(),arguments:[products[index] ]);
                            },
                            child:  Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(color: Colors.redAccent,borderRadius: BorderRadius.circular(8)),
                              child: Icon(Icons.add,size: 25,color: Colors.white,),
                            ),
                           ))
            ],
          ))
          );
  }),
    );
        }

       

  }
