
import 'package:final_ecommerce_app/home_screen/payment_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


 class MyCard extends StatefulWidget {
const MyCard({Key? key}) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
    }
  class _MyCardState extends State<MyCard> {


   List getcarsItems =[];

   @override
    void initState() {
    // TODO: implement initState
    super.initState();
    carddataItem();
  }



    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color(0xfffffff),
        appBar: AppBar(
          title: Text('Your cart has ${getcarsItems.length} items',style: TextStyle(fontSize: 12),),
          
            backgroundColor: Color(0xff3c3c44),
            actions:  [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: MaterialButton(onPressed: () { 
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return PaymentPage();
                  }));
                },
                shape: StadiumBorder(),
                elevation: 10,
                color: Color(0xffaefeb8),
                child: Text('Chekout'),
                ),
              )
            ],
        ),
        body:SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 5),
            constraints: const BoxConstraints.expand(),
            child:getcarsItems.isEmpty?const Center(
              child: CircularProgressIndicator(),):
              ListView.separated(
              itemCount: getcarsItems.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context,index){
                return Stack(
              children: [
             Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.only(top: 5,left: 5),

            decoration: BoxDecoration(
                color: const Color(0xffc4b4a4),
                borderRadius: BorderRadius.circular(10.0)
            ),
            height: 160,
            width: double.infinity,
            child: Row(
              children:   [
                CircleAvatar(
                  backgroundColor:Colors.black,
                  radius:42,
                  
                  backgroundImage:NetworkImage(getcarsItems[index]['image']),
                ),
                const SizedBox(width: 3,),
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 5),
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(getcarsItems[index]['catagory'],style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      SizedBox(height:2,),
                      Text('৳ ${getcarsItems[index]['price']}',style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Text(getcarsItems[index]['title'],style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                      ],
                    ),
                )
                  ],
                ),
                ),

                      Positioned(
                          top: 5,
                          right: 15,
                          child: Icon(Icons.more_vert),
                        ),
                  Positioned(
                    bottom: 5,
                    right: 8,
                    child: MaterialButton(
                                   height: 30,
                    onPressed: (){
                    removeItemFromCart(index=index); 
                    Fluttertoast.showToast(msg: 'Succesefully remove card items');                     },
                    shape: const StadiumBorder(),
                    color: const Color(0xfffc0404),
                    elevation: 10,
                    child: const Text('Remove'),
                  
                  ),
                  ),           
                 ],
                );


               }, separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 8,);
               },),
             ),
           ),
         );
      }

              carddataItem() async {
                  FirebaseFirestore firestore = FirebaseFirestore.instance;

                  var cartItem = await firestore.collection('users-cart').get();

                  for (var doc in cartItem.docs) {
                    setState(() {
                      Map map = {
                        'title': doc['title'],
                        'catagory': doc['catagory'],
                        'image': doc['image'],
                        'price': doc['price'],
                        'description': doc['description'],
                        'id': doc.id,
                      };
                      getcarsItems.add(map);
                    });
                    print(getcarsItems);
                  }
                }


                void removeItemFromCart(int index) async {
                  FirebaseFirestore firestore = FirebaseFirestore.instance;
                  await firestore.collection('users-cart').doc(getcarsItems[index]['id']).delete();
                  getcarsItems.clear();
                  carddataItem();
                  setState(() {});
                }


              }

