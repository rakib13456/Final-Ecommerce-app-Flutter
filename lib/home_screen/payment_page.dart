import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({ Key? key }) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('Select a Payment method',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(height: 30,),
                Text('Payment Method',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 7,),
                      FittedBox(
                        child: Row(
                          
                          children: [
                            Container(
                              height: 50,
                              width: 
                              80,
                              color: Colors.blue,
                              child:Image.asset('assets/images/master-card.png',fit: BoxFit.cover,)
                              
                            ),
                            SizedBox(width: 20,),
                             Container(
                              height: 50,
                              width: 
                              80,
                              color: Colors.amber,
                              child:Image.asset('assets/images/visa.png',fit: BoxFit.cover,)
                            ),
                            SizedBox(width: 20,),
                            Container(
                              height: 50,
                              width: 
                              80,
                              color: Colors.red,
                              child: Image.asset('assets/images/blik.png',fit: BoxFit.cover,)
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffbebebe),
                              hintText: 'Enter Card Name',hintStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                
                                borderSide: BorderSide(width: 14,style: BorderStyle.none,color: Color(0xff082c6c)),
                                borderRadius: BorderRadius.circular(10))
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                        height: 50,
                          child: TextField(
                            
                            decoration: InputDecoration(
                              fillColor: Color(0xffbebebe),
                              filled: true,
                              hintText: 'Enter Card Number',hintStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 14,style: BorderStyle.none,color: Color(0xff082c6c)),
                                borderRadius: BorderRadius.circular(10))
                            ),
                          ),
                        ),
                      ),
                    FittedBox(
                      child: Row(
                        children: [
                             Column(
                               children: [
                                 Text('Expiration Date',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                SizedBox(height: 3,),
                                 Container(
                                   height: 50,
                                   width: 140,
                                   child: TextField(
                                     
                                     decoration: InputDecoration(
                                       fillColor: Color(0xffbebebe),
                                       filled: true,
                                       hintText: 'MM/YY',hintStyle: TextStyle(color: Colors.black),
                                       border: OutlineInputBorder(
                                         borderSide: BorderSide(width: 14,style: BorderStyle.none,color: Color(0xff082c6c)),
                                         borderRadius: BorderRadius.circular(10))
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                             SizedBox(width: 15,),
                         Column(
                           children: [
                             Text('Security Code',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                             SizedBox(height: 3,),
                             Container(
                               height: 50,
                               width: 140,
                               child: TextField(
                                 
                                 decoration: InputDecoration(
                                   fillColor: Color(0xffbebebe),
                                   filled: true,
                                  // hintText: 'Enter Card Number',hintStyle: TextStyle(color: Colors.black),
                                   border: OutlineInputBorder(
                                     borderSide: BorderSide(width: 14,style: BorderStyle.none,color: Color(0xff082c6c)),
                                     borderRadius: BorderRadius.circular(10))
                                 ),
                               ),
                             ),
                           ],
                         ),
                        
                        ],
                      ),
                    ),
                    SizedBox(height: 17,),
                 Row(
                   //crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                      Checkbox(
                           value: true, 
                           onChanged: (value){},
                         ),
                         Text('Remember my card details')
                   ],
                 )  ,
                 MaterialButton(onPressed: (){},
                 minWidth: 280,
                 height: 50,
                 color: Color(0xff6a46f7),
                 child: Text('Pay ${349}'),
                 ) 
            ]
            ),
          ),
        ),
      ),
      
    );
  }
}