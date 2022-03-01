import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  _WishListState createState() => _WishListState();
}




class _WishListState extends State<WishList> {

List wishlistItems =[];

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWishlistData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Wish List'),
        centerTitle: true,
      ),

      body:SafeArea(
        child: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.only(left: 5,),
          constraints: BoxConstraints.expand(),
          child: wishlistItems.isEmpty?Center(
            child: CircularProgressIndicator(),)
            : ListView.separated(
            itemCount: wishlistItems.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context,index){
                return Stack(
               children: [
              Container(
              margin: EdgeInsets.all(3),
               padding: const EdgeInsets.all(2),
          
              decoration: BoxDecoration(
               color: Colors.grey,
                borderRadius: BorderRadius.circular(10.0)
                  ),
                height:160,
                width: double.infinity,
                child: Row(
                children:   [
                  CircleAvatar(
                    backgroundColor:Colors.black,
                    radius:42,
                      backgroundImage: NetworkImage(wishlistItems[index]['image']),
             ),
             SizedBox(width: 3,),
             Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Text(wishlistItems[index]['catagory'],style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                 SizedBox(height: 6,),
                 Text('৳ ${wishlistItems[index]['price']}',style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                  Text(wishlistItems[index]['title'],style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                
               ],
             )
           ],
          ),
        ),

        Positioned(
          top: 5,
            right: 13,
              child: InkWell(
                onTap: () {
                  removeItemFromWishlist(index=index);
                  Fluttertoast.showToast(msg: 'Succesefully remove wishlist item');
                },
                child: Icon(Icons.delete,color: Colors.black)),
        ),
        Positioned(
          right: 7,
          bottom: 5,
          width: 115,
          child:  MaterialButton(                 
                   minWidth: 14,
                   onPressed: (){
                     addToCart(index=index);
                     Fluttertoast.showToast(msg: 'Succcesefully added to card');
                   },
                   shape: StadiumBorder(),
                   color: Colors.pink,
                   elevation: 10,
                   child: Row(
                     children: [
                       Icon(Icons.shopping_cart),
                       Text('Add Card')
                     ],
            ),

           ))
      ],
    );
              }, separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 5,);
          },),
        ),
      ),
    );
  }

    getWishlistData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    var cartData = await firestore.collection('whish-list').get();

    for (var doc in cartData.docs) {
      setState(() {
        Map map = {
          'title': doc['title'],
          'catagory': doc['catagory'],
          'image': doc['image'],
          'price': doc['price'],
          'description': doc['description'],
          'id': doc.id,
          
        };
        wishlistItems.add(map);
      });
      print(wishlistItems);
    }
  }

      void addToCart(int index) {
       // int price = int.parse(widget.productDetails['price'] * quantity);
        FirebaseFirestore firestore = FirebaseFirestore.instance;

       firestore.collection('users-cart').add({
      'catagory': wishlistItems[index]['catagory'],
      'description': wishlistItems[index]['description'],
      'image': wishlistItems[index]['image'],
      'price': wishlistItems[index]['price'],
      'title': wishlistItems[index]['title'],
      
    });
  }

void removeItemFromWishlist(int index) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection('whish-list').doc(wishlistItems[index]['id']).delete();
    wishlistItems.clear();
    getWishlistData();
    setState(() {});
  }
}