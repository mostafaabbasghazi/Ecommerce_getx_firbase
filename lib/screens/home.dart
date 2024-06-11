import 'package:firebaseecom/constant/routs_name.dart';
import 'package:firebaseecom/controller/pages/home.dart';
import 'package:firebaseecom/screens/cat_products.dart';
import 'package:firebaseecom/screens/product_deatails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    HomeController controller=Get.put(HomeController());
   

    return Scaffold(
      backgroundColor: Color(0xf2f2f2f2),
      body: Container(
        margin: EdgeInsets.only(top: 50,left: 20,right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [ Text("Hi Mohamed",style: TextStyle(color: Colors.black,fontSize: 28,fontWeight: FontWeight.bold),
            ),
             Text("Good Morning",style: TextStyle(color: Colors.black54,fontSize: 20,fontWeight: FontWeight.w400))
            
            ],),
               
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset("images/boy.jpg",height: 70,width: 70,fit: BoxFit.cover,filterQuality: FilterQuality.high,),
            )
              ],
            ),
            SizedBox(height: 20,),
            
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
              width: MediaQuery.of(context).size.width,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search Product",
                  hintStyle: TextStyle(fontSize: 20,),
                  border:InputBorder.none,
                  prefixIcon: Icon(Icons.search,size: 30,)
                  
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("Categories",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),)
            ],),GetBuilder<HomeController>(
              builder: (controllerr){
                return  Container(
              height: 120,
              margin: EdgeInsets.only(left: 20),
              child: ListView.builder(
                itemCount: controller.categeries.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return Container(
                    margin: EdgeInsets.only(right: 20,top: 20),
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(controllerr.categeries[index]["imageLink"].toString(),height: 50,fit: BoxFit.cover,),
                        InkWell(
                          onTap: (){
                            Get.to(()=>CatProducts(),arguments: [
                              controllerr.categeries[index]["categorytName"].toString(),
                              controllerr.categeries[index]["categorytNameAr"].toString(),
                      ]);
                          },
                          child: Icon(Icons.arrow_circle_right),
                        )
                      ],
                    ),
                  );
                }),
            );
              }),
           
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
              height: 230,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: controllerr.productsDiscount.length,
                itemBuilder: (context,index){
               
              
                    return  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Image.network(controllerr.productsDiscount[index]["imageLink"],height: 120,width: 120,),
                        Text(controllerr.productsDiscount[index]["productName"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Text("\$ ${(controllerr.productsDiscount[index]["price"]-controllerr.productsDiscount[index]["discount"]).toString()}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                        Row(
                          
                          children: [
                            Text.rich(TextSpan(children: <TextSpan>[
                              new TextSpan(text: 
                                "\$ ${controllerr.productsDiscount[index]["price"].toString()}",style: TextStyle(fontSize: 17,color: Colors.redAccent,decoration: TextDecoration.lineThrough,)
                              )
                            ])),
                            SizedBox(width: 40,),
                           InkWell(
                            onTap: (){
                              Get.to(()=>ProductDeatails(),arguments:[controllerr.productsDiscount[index] ]);
                            },
                            child:  Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(color: Colors.redAccent,borderRadius: BorderRadius.circular(8)),
                              child: Icon(Icons.add,size: 25,color: Colors.white,),
                            ),
                           )
                          ],
                        )
                      ],
                    ),
                  );
                  
                },),
            );
           })
           
          ],
        ),
      ),
    );
  }
}