import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class DetailsPage extends StatefulWidget {
  const DetailsPage({ Key? key,required this.productDetailePage}) : super(key: key);

final Map productDetailePage;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

int quantity = 1;
  late TextEditingController quantityController;
  bool isSelected = false;

@override
  void initState() {
    // TODO: implement initState
    
     quantityController = TextEditingController(text: quantity.toString());
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme:  IconThemeData(color: Colors.black),
        elevation: 10,
        title:  Text('Product Details',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        actions:  [
          Row(
            children: [
              GestureDetector(
                onTap: (){
                  addToWishlist();
                  Fluttertoast.showToast(msg: 'Succesefully added to wishlist');
                } ,
                child:  Icon(Icons.favorite)),
               Icon(Icons.more_vert,size: 30,)
            ],
          )
            
        ],
      ),
      body: SafeArea(
        child: Container(
            constraints:  BoxConstraints.expand(),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                padding:  EdgeInsets.all(20),
               
                 height: 200,
                width: double.infinity,
                child:Row(
                  
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Icon(Icons.arrow_back_ios,color: Colors.black,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(widget.productDetailePage['image'],fit: BoxFit.cover,)),
                   Icon(Icons.arrow_forward_ios,color: Colors.black,),
                ]) ,
                
                decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(16),
              ), ),
                
              Expanded(
                child: Container(

                  padding: EdgeInsets.only(left: 15,right: 15,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.productDetailePage['title'],style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        MaterialButton(
                          onPressed: (){},
                          color: Colors.grey,
                          child:  Text('★★★',style: TextStyle(color: Colors.yellow,fontSize: 15),),
                          shape:  StadiumBorder(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                     Text('৳ ${int.parse(widget.productDetailePage['price'])*quantity}',style: const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                   const SizedBox(height: 10,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        
                          MaterialButton(
                            color:  Color.fromARGB(255, 11, 11, 240),
                            shape:  StadiumBorder(),
                            onPressed: () {
                              if (quantity > 1) quantity--;
                              setState(() {});
                            },
                            child: Text(
                              '-',
                              style: TextStyle(color: Colors.white,fontSize: 24),
                            ),
                          ),
                          Container(
                            width: 50,
                            child: TextField(
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                quantity = int.parse(value);
                                setState(() {});
                              },
                              controller: quantityController,
                              decoration: InputDecoration(
                                  isDense: true, border: OutlineInputBorder()),
                            ),
                          ),
                          MaterialButton(
                            color:  Color.fromARGB(255, 11, 11, 240),
                            shape:  StadiumBorder(),
                            onPressed: () {
                              quantity++;
                              setState(() {});
                              print(quantity);
                            },
                            child:  Text(
                              '+',
                              style: TextStyle(color: Colors.white,fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                       Divider(height: 20,color: Colors.lightBlue ),
                        SizedBox(height: 10,),
                       Text('Product Details ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold ,decoration: TextDecoration.underline),),
                      
                       SizedBox(height: 15,),
                      Text(widget.productDetailePage['description'],style: const TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                       SizedBox(height: 20,),
                      MaterialButton(
                        color: Color.fromARGB(255, 114, 7, 255),
                        height: 60,
                       shape:  StadiumBorder(),
                        onPressed: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MaterialButton(
                                onPressed: (){},
                              shape:  StadiumBorder(),
                              color: Colors.white,
                              child: Text('Buy Now') ,
                                ),
                            MaterialButton(
                              
                              onPressed: (){
                                addToCart();
                                Fluttertoast.showToast(msg: 'Succesefully added to card');
                              },
                              shape:  StadiumBorder(),
                              color: Colors.white,
                              child: Row(
                                children:  [
                                  Icon(Icons.shopping_cart),
                                  Text('Add Card')
                                ],
                              ),
                            )
                          ],
                        ),
                      )   
                    ],
                  ),
                )

              )

            ],
          ),
        ),
      ),
    );
  }
   void addToCart() {
    // int price = int.parse(widget.productDetails['price'] * quantity);
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    firestore.collection('users-cart').add({
      'catagory': widget.productDetailePage['catagory'],
      'description': widget.productDetailePage['description'],
      'image': widget.productDetailePage['image'],
      'price': widget.productDetailePage['price'],
      'title': widget.productDetailePage['title'],
      
    });
  }

  void addToWishlist() {
    // int price = int.parse(widget.productDetails['price'] * quantity);
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    firestore.collection('whish-list').add({
      'catagory': widget.productDetailePage['catagory'],
      'description': widget.productDetailePage['description'],
      'image': widget.productDetailePage['image'],
      'price': widget.productDetailePage['price'],
      'title': widget.productDetailePage['title'],
      
    });
  }

}
