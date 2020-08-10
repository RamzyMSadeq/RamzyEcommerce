import 'package:e_commerce_project/models/product.dart';
import 'package:flutter/material.dart';

class ProfileUserPhoto extends StatelessWidget {
  List<Product> myProduct =[
    Product(
        image: 'assets/images/heelscategory.png' , 
        title: 'FS - Nike Air Max 270 React...' ,
        rating: 4.5,
        price: 299.43,
        priceAfter: 534.33,
        disacount: 50,
        ),
        
    Product(
        image: 'assets/images/shoescaterory.png' , 
        title: 'FS - Nike Air Max 270 React...' ,
        rating: 5,
        price: 299.43,
        priceAfter: 534.33,
        disacount: 24,
        ) ,
    Product(
        image: 'assets/images/menshirt.png' , 
        title: 'FS - Nike Air Max 270 React...' ,
        rating: 5,
        price: 299.43,
        priceAfter: 534.33,
        disacount: 24,
        ),
    Product(
        image: 'assets/images/bagcategory.png' , 
        title: 'FS - Nike Air Max 270 React...' ,
        rating: 5,
        price: 299.43,
        priceAfter: 534.33,
        disacount: 24,
        )  , 
        Product(
        image: 'assets/images/dresscategory.png' , 
        title: 'FS - Nike Air Max 270 React...' ,
        rating: 5,
        price: 299.43,
        priceAfter: 534.33,
        disacount: 24,
        )  , 
        Product(
        image: 'assets/images/womenshirt.png' , 
        title: 'FS - Nike Air Max 270 React...' ,
        rating: 5,
        price: 299.43,
        priceAfter: 534.33,
        disacount: 24,
        )  , 
        Product(
        image: 'assets/images/shoescaterory.png' , 
        title: 'FS - Nike Air Max 270 React...' ,
        rating: 5,
        price: 299.43,
        priceAfter: 534.33,
        disacount: 24,
        )  , 
        Product(
        image: 'assets/images/slider.png' , 
        title: 'FS - Nike Air Max 270 React...' ,
        rating: 5,
        price: 299.43,
        priceAfter: 534.33,
        disacount: 24,
        )  , 
        Product(
        image: 'assets/images/womenshirt.png' , 
        title: 'FS - Nike Air Max 270 React...' ,
        rating: 5,
        price: 299.43,
        priceAfter: 534.33,
        disacount: 24,
        )  , 
        
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: GridView.builder(
        itemCount: myProduct.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
         itemBuilder: (context, index) {
           return Container(
             margin: EdgeInsets.all(5),
             
             decoration: BoxDecoration(
               color: Colors.blue,
               borderRadius: BorderRadius.all(Radius.circular(30)),
               image: DecorationImage(image: AssetImage(myProduct[index].image),
               fit: BoxFit.cover
               )
             ),
           );
         },) ,
      
    );
  }
}