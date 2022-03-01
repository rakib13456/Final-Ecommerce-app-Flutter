import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_ecommerce_app/home_screen/details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List items = [];

  List catagory = [
    'Top',
    'Table',
    'Bed',
    'Chair',
    'Sofa',
    'Almira',
    'Clock',
    'Shoes',

    
  ];
  List catagory2=['top',
    'table',
    'bed',
    'chair',
    'sofa',
    'almira',
    'clock',
    'shoes'
    ];
  int selectedIndex =0;

   var collectionName = 'top';

  TextEditingController searchController = TextEditingController();


   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData('top');
  }

  Widget topItem(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       const Text(
          'Your Best Products',
          style: TextStyle(color:Colors.black,fontSize: 25, fontWeight: FontWeight.bold),
        ),

        const Text(
          'Choose Your Quaility Product',
          style: TextStyle(color:Colors.black,fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            height: 40,
            width: double.infinity,
            child: TextField(
             
              decoration: InputDecoration(
                  hintText: 'Search here',hintStyle:TextStyle(color: Color(0xff1d1135),fontWeight: FontWeight.w500) ,
                  suffixIcon: IconButton(
                    onPressed: () {
                        items.clear();
                        getDataBySearch(collectionName);
                       // Fluttertoast.showToast(msg: 'search you data',backgroundColor: Colors.blue,textColor: Colors.black) ;
                    },
                  icon: Icon(Icons.search),
                  ),
                  fillColor: Colors.grey,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20.0))),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 40,
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                          onTap: (() {
                            selectedIndex =index;
                            collectionName = catagory2[selectedIndex];
                            items.clear;
                            getData(catagory2[selectedIndex]);
                            setState(() {
                              
                            });
                          }),
                      
                      child: CircleAvatar(
                        child: Text(
                          catagory[index],
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold,color: selectedIndex==index?Colors.white:Colors.black),
                        ),
                        backgroundColor: selectedIndex ==index ?Colors.deepOrange:null,
                        radius: 20,
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 30,
                );
              },
              itemCount: catagory.length),
        ),
        SizedBox(
          height: 15,
        ),
        Expanded(
          child: items.isEmpty?Center(
            child: CircularProgressIndicator(),):
            GridView.builder(
              padding: EdgeInsets.all(8),
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.4 / 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 10,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetailsPage(productDetailePage: items[index],)));
                  },
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Color(0xff5c84ac),
                        borderRadius: BorderRadius.circular(16)),
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child:
                        Column(
                          children: [
                             Row(
                              
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        addToWishlist(index=index);
                                       Fluttertoast.showToast(msg: 'Succesefully added to wishlist');

                                      },
                                      child: Icon(Icons.favorite,size: 25,color: Color(0xff080818),)),
                                   
                                      GestureDetector(
                                        onTap: (){
                                          addToCart(index=index);
                                          Fluttertoast.showToast(msg: 'Succesefully added to card');
                                        },
                                        child: Icon(Icons.shopping_cart))
                                  ],
                                ),
                               Container(
                                  margin:EdgeInsets.all(5),
                                height: 110,
                                width: double.infinity,
                                decoration: BoxDecoration(

                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(16)
                                ),
                                child: ClipRRect(

                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    items[index]['image'],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                          
                            Column(
                              children: [
                                Text(items[index]['catagory'],style: TextStyle(fontWeight: FontWeight.bold),),
                                Text('৳ ${items[index]['price']}',style: TextStyle(fontStyle: FontStyle.italic),),
                               

                              ],

                            ),


                          ],
                        ),
                  ),
                );
              }
            ),
        )
      ],
    );
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color(0xffbcccdc),
     
      body: SafeArea(

        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: topItem(context),
        ),
      ),
    );
  }


 
 
 getData(String keyWord) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var data = await firestore.collection(keyWord).get();

    for (var doc in data.docs) {
      setState(() {
        Map map = {
          'title': doc['title'],
          'description': doc['description'],
          'image': doc['image'],
          'price': doc['price'],
          'catagory':doc ['catagory']
        };
        items.add(map);
      });
      print('items length is ${items.length}');
    }
  }
  
  void addToCart(int index) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

          firestore.collection('users-cart').add({
        'catagory': items[index]['catagory'],
        'description': items[index]['description'],
        'image': items[index]['image'],
        'price': items[index]['price'],
        'title': items[index]['title'],
        
   
    });
 }

 void addToWishlist(int index) {
    // int price = int.parse(widget.productDetails['price'] * quantity);
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    firestore.collection('whish-list').add({
      'catagory': items[index]['catagory'],
      'description':items[index]['description'],
      'image':items[index]['image'],
      'price': items[index]['price'],
      'title':items[index]['title'],
      
    });
  }
 
   getDataBySearch(String collectionName) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    var data = await firestore
        .collection(collectionName)
        .where('title', isEqualTo: searchController.text)
        .get();

    for (var doc in data.docs) {
      setState(() {
        Map map = {
          'title': doc['title'],
          'catagory': doc['catagory'],
          'image': doc['image'],
          'price': doc['price'],
          'description': doc['description'],
        
        };
        items.add(map);
      });
      print(items);
    }
  }
}

