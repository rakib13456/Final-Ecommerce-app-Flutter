import 'package:flutter/material.dart';

class MyTextFeild extends StatelessWidget {

  TextEditingController controller;
  final Widget suFix,preFix;
  final String hinText;
  bool obsecureText;
  Function (String) onChange;


  MyTextFeild({ required this.onChange,required this.suFix,required this.preFix,required this.controller,required this.hinText,required this.obsecureText, suffixIcon}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
      child: TextField(
        obscureText: obsecureText,
        controller:controller ,
        onChanged:onChange ,
        decoration: InputDecoration(
            hintText: hinText,
            prefixIcon: preFix,
            suffixIcon: suFix,
            fillColor: Colors.grey,
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(16.0)
            )
        ),

      ),
    );
  }
}


