import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebaseecom/screens/card.dart';
import 'package:firebaseecom/screens/home.dart';
import 'package:firebaseecom/screens/profile.dart';
import 'package:flutter/material.dart';

class Bottomnavigationbar extends StatefulWidget {
  const Bottomnavigationbar({super.key});

  @override
  State<Bottomnavigationbar> createState() => _BottomnavigationbarState();
}

class _BottomnavigationbarState extends State<Bottomnavigationbar>{

  late List<Widget> pages;

  late Home home;
  late CardProduct card;
  late Profile profile;
  int curentIndex=0;

  

  @override
  void initState() {
    home=Home();
    card=CardProduct();
    profile=Profile();

    pages=[home,card,profile];
    super.initState();
  
  }

  @override
  void dispose() {
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (i){
          setState(() {
            curentIndex=i;
          });
        },
        height: 65,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 500),
        items:const [
        Icon(Icons.home_outlined,color: Colors.white,),
        Icon(Icons.shopping_bag_outlined,color: Colors.white,),
        Icon(Icons.person_2_outlined,color: Colors.white,),
      ],),
      body: pages[curentIndex],
    );
  }
}