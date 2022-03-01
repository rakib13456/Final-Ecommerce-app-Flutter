import 'package:flutter/material.dart';

class PamentBody extends StatefulWidget {
  const PamentBody({ Key? key }) : super(key: key);

  @override
  _PamentBodyState createState() => _PamentBodyState();
}

class _PamentBodyState extends State<PamentBody> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      
          child: Column(
            children: [
              Row(
                children: [
                Container(
                      height: 30,
                      width: 40,
                      child: Text('Card'),
                )
                ],
              )
            ]),
    );
  }
}