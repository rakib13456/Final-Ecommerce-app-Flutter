import 'dart:async';
import 'package:final_ecommerce_app/screen/signin_screen.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), (){
      Navigator.of(context).push( MaterialPageRoute(builder: (context) =>const LoginScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          constraints: BoxConstraints.expand(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                SizedBox(height: 30,),
              Image.asset('assets/images/splash.jpg'
              ,height: 220,width: 200,),
              Text('Shoping Bazer',style: TextStyle(fontSize: 25),),
                SizedBox(height: 30,),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
