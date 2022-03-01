import 'package:final_ecommerce_app/widget_screen/profile_data.dart';
import 'package:flutter/material.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        
        title: Text('My Profile'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Row(
              
              children: [
                Icon(Icons.shopping_bag,),
                SizedBox(width: 5,),
                Icon(Icons.more_vert,color: Colors.black,)
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
                 SizedBox(
        height: 115,
        width: 115,
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            const CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage("assets/images/circle3.png",),
            ),
            Positioned(
              right: -16,
              bottom: 0,
              child: SizedBox(
                height: 46,
                width: 46,
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(color: Colors.white),
                    ),
                    primary: Colors.white,
                    backgroundColor: const Color(0xFFF5F6F9),
                  ),
                  onPressed: () {},
                  child: Image.asset("assets/images/camera.png"),
                ),
              ),
            )
          ],
        ),
          ),
                ProfileData(
                  
                  icon: 'assets/images/account.png', 
                  text: 'My Account',
                  press:(){} ,),
                ProfileData(
                  
                  icon: 'assets/images/update.png', 
                  text: 'Edit Profile',
                  press:(){} ,),

                   ProfileData(
                  
                  icon: 'assets/images/order.png', 
                  text: 'Previus Oder Detaile',
                  press:(){} ,),

                   ProfileData(
                  icon: 'assets/images/info.png', 
                  text: 'Notifications',
                  press:(){} ,), 
                  ProfileData(
                  icon: 'assets/images/help.png', 
                  text: 'Help Center',
                  press:(){} ,), 
                  ProfileData(
                  icon: 'assets/images/setting.png', 
                  text: 'Setting',
                  press:(){} ,),
        
        ],),
      )
    );
  }
}
