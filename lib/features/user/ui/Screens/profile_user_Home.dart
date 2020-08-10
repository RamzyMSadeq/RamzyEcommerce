import 'package:e_commerce_project/features/user/ui/widgets/card_add_products.dart';
import 'package:e_commerce_project/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;

class ProfileUserHome extends StatelessWidget {
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

    return ListView(

      children: <Widget>[
        Container(
          height: ScreenUtil().setHeight(230),
          
          child: Column(
            children: <Widget>[

            Container(
              margin: EdgeInsets.only(top: 20),
              height: 30,
              width: 360,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Photo" , style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: style.Colors.mainColor
                  ),),
                  InkWell(
                    onTap: (){
                      
                    },
                                      child: Text("See More", style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: style.Colors.secondColor
                    ),),
                  )
                ],
              ),
            ),


              Container(
                height: 180,
                child: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
                return Stack(
                  children: <Widget>[
                    Container(
                  margin: EdgeInsets.only(left: 20 , top: 20),
                  width: ScreenUtil().setWidth(150),
                  height: ScreenUtil().setHeight(150),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(image: AssetImage(myProduct[index].image) ,
                    fit: BoxFit.cover
                    )
                  ),
                ),

                index == 5  ? 
                Container(
                  margin: EdgeInsets.only(left: 20 , top: 20),
                  width: ScreenUtil().setWidth(150),
                  height: ScreenUtil().setHeight(150),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.black87.withOpacity(.5)
                  ),
                  child: Center(
                    child: Text("See More .." , style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                    ),),
                  ),
                ) 
                :
                Center()
                  ],
                );
                
            },),
              ),
            ],
          )
        ),
       // SizedBox(height: 20,),

        Container(
          margin: EdgeInsets.all(10),

          height: 230,
          //color: Colors.red,
          child: Card(
           child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                   margin: EdgeInsets.only(top: 20),
                   height: 30,
                   width: 360,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Posts".toUpperCase() , style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: style.Colors.mainColor,

                      ),),
                      IconButton(icon: Icon(Icons.settings , color: style.Colors.secondColor,), onPressed: null)
                    ],
                  ),
                ),
                SizedBox(height: 20,),


                Row(
                 // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        
                        //color: style.Colors.mainColor,
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage("assets/images/profilemahdi.jpg"), 
                        fit: BoxFit.cover
                        )
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 40,
                      width: 250,
                      child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Add Products ..'
                      ),
                    ),

                    )
                    
                  ],
                ),
                Divider(thickness: 1,),
                Container(
                  width: 400,
                  child: Row(
                    
                    children: <Widget>[
                      Row(children: <Widget>[
                        IconButton(icon: Icon(Icons.add,color: style.Colors.mainColor,), onPressed: (){}),
                        Text("Add Product"),
                        
                      ],),
                      VerticalDivider(),
                      Row(children: <Widget>[
                        IconButton(icon: Icon(Icons.photo,color: style.Colors.mainColor,), onPressed: (){}),
                        Text("Photo"),
                        
                      ],),
                      VerticalDivider(color: Colors.red,),
                      Row(children: <Widget>[
                        IconButton(icon: Icon(Icons.videocam,color: style.Colors.mainColor,), onPressed: (){}),
                        Text("Video"),
                        
                      ],),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ) ,



        /////// Card Add Product 
        
        Container(
          height: 700,
          
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                child: Card(child: CardAddProducts())) ;
            },
            ),
        )
        


        ////// End Card Add Product
      ],
      
    );
  }
}