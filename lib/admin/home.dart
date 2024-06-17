
import 'package:flutter/material.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Admin Panel",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
      body: Container(
        margin: EdgeInsets.only(top: 70,left: 20,right: 20),
        child: ListView(
          children: [
            InkWell(
              child:Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.redAccent,borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width,
                child: Center(child: Text("Add Category",style: TextStyle(fontSize: 20,color: Colors.white),),)
              ),
            ),SizedBox(height: 30,),
            InkWell(
              child:Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.redAccent,borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width,
                child: Center(child: Text("Add Product",style: TextStyle(fontSize: 20,color: Colors.white),),)
              ),
            ),SizedBox(height: 30,),
            InkWell(
              child:Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.redAccent,borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width,
                child: Center(child: Text("All Categories",style: TextStyle(fontSize: 20,color: Colors.white),),)
              ),
            ),SizedBox(height: 30,),
            InkWell(
              child:Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.redAccent,borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width,
                child: Center(child: Text("All Products",style: TextStyle(fontSize: 20,color: Colors.white),),)
              ),
            ),SizedBox(height: 30,),
            InkWell(
              child:Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.redAccent,borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width,
                child: Center(child: Text("All Users",style: TextStyle(fontSize: 20,color: Colors.white),),)
              ),
            ),
            SizedBox(height: 30,),
            InkWell(
              child:Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.redAccent,borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width,
                child: Center(child: Text("Orders",style: TextStyle(fontSize: 20,color: Colors.white),),)
              ),
            ),SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}