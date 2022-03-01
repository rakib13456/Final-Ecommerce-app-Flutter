import 'package:flutter/material.dart';

class ProfileData extends StatelessWidget {
  const ProfileData(
    {required this.icon,this.press,required this.text, 
  Key? key }) : super(key: key);

final String text, icon;
  final VoidCallback? press;
 
  

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary:Colors.amberAccent ,
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Colors.grey,
        ),
        onPressed: press,
        child: Row(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              child: Image.asset(icon,fit: BoxFit.fill,
              ),
            ),
            SizedBox(width: 20),
            Expanded(child: Text(text,style: TextStyle(color: Colors.black,fontSize: 13),)),
            Icon(Icons.arrow_forward_ios,color: Colors.black,),
          ],
        ),
      ),
    );
  }
}