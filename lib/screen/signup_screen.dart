import 'package:final_ecommerce_app/screen/signin_screen.dart';
import 'package:final_ecommerce_app/widget_screen/button_widget.dart';
import 'package:final_ecommerce_app/widget_screen/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';




class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();

  TextEditingController nameController=TextEditingController();
  bool isVisibility=true;

  Widget signUpItem(){
    return Column(
      children: [
        const SizedBox(height: 16,),
        Image.asset("assets/images/login5.jpg",
          height:200,
          width: 250,
        ),
        Column(
          children: [
            MyTextFeild(
              onChange: (value){},
              suFix: Icon(Icons.drive_file_rename_outline,color:Colors.black),
              preFix: Icon(Icons.pregnant_woman,color:Colors.black,),
              controller: nameController,
              hinText: 'User Name',
              obsecureText: isVisibility !=isVisibility,
            ),
            MyTextFeild(
                onChange: (value){
                  setState(() {

                  });
                },
                suFix: emailController.text.isNotEmpty ? GestureDetector(
                    onTap: (){
                      emailController.clear();
                    },
                    child: const Icon(Icons.clear,color: CupertinoColors.black,)):Text(''),
                preFix: const Icon(Icons.email,color: CupertinoColors.black,),
                controller:emailController ,
                obsecureText:isVisibility !=isVisibility ,
                hinText: 'Email'),
            MyTextFeild(
                onChange: (value){
                  setState(() {

                  });
                },
                suFix: GestureDetector(
                    onTap: (){
                      isVisibility= !isVisibility;
                      setState(() {

                      });
                    },
                    child: Icon(isVisibility?Icons.visibility:Icons.visibility_off,color: CupertinoColors.black,)),
                preFix: const Icon(Icons.lock,color:CupertinoColors.black, ),
                controller: passController,
                hinText: 'Password',
                obsecureText:isVisibility ),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Column(
                children: [
                  ButtonWidget(
                      text:'Sign Up ',
                      color:Colors.blue,
                      onPress: (){
                        userSignUp();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      }),
                  TextButton(onPressed: (){},child: Text('Forgate Password'),),
                  //SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(' Have an account?'),
                      TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const LoginScreen();
                            }));
                          },
                          child:const Text('Sign In',style: TextStyle(fontSize: 15),))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              signUpItem()
            ],
          ),
        ),
      ),
    );
  }
  userSignUp()async{

    try {

      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passController.text);
          userData();
          if (userData() !=null){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
          }else{
            Fluttertoast.showToast(msg: "Succesfully create an account ");
          }


    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: 'The account already exists for that email.');

      }
    } catch (e) {
      print(e);
    }


  }
userData(){
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  firestore.collection('users').doc(emailController.text).set({
    'userName':nameController.text,
    'userEmail':emailController.text,
    'userPass':passController.text
  });
}

}


