
import 'package:final_ecommerce_app/bottom_nav_bar/profile_nav_page.dart';
import 'package:final_ecommerce_app/bottom_nav_bar/wishlist_nav_page.dart';
import 'package:flutter/material.dart';

import '../bottom_nav_bar/card_nav_age.dart';
import '../bottom_nav_bar/home_page.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  int index = 0;
  List pages=[const MyHomePage(),const MyCard(),const WishList(),const ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10.0,
        type: BottomNavigationBarType.fixed,
        currentIndex: index ,
        onTap: (value){
          index=value;
          setState(() {

          });
        },

        items: const [BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Card'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite,),label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),

        ],
      ),
    );
  }
}


