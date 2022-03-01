import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  //const ButtonWidget({Key? key}) : super(key: key);

  final String text;
  final Color color;
  final VoidCallback onPress;


  const ButtonWidget({required this.text,required this.color,required this.onPress });
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed:onPress,
      color:color,
      elevation: 100,
      minWidth: double.infinity,
      height: 45,
      shape: const StadiumBorder(),
      child: Text(text,
        style: const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
      ),
    );
  }
}

