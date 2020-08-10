


import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_project/features/user/Provider/e_c_provider.dart';
import 'package:e_commerce_project/features/user/ui/Screens/success_screen.dart';
import 'package:e_commerce_project/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:provider/provider.dart';

class CardCart extends StatefulWidget {
  CartModel product;
  CardCart(this.product);
  

  @override
  _CardCartState createState() => _CardCartState();
}

class _CardCartState extends State<CardCart> {
  
  int count=0;
  
  @override
  Widget build(BuildContext context) {
    ECProvider myProvider = Provider.of<ECProvider>(context , listen: false);
     

   // Provider.of<ECProvider>(context, listen: false).setTotalCart(count);
    
    return Consumer<ECProvider>(
      builder: (context, value, child) {
        
        return Container(
        margin: EdgeInsets.all(10),
        height: ScreenUtil().setHeight(120),
        width: ScreenUtil().setWidth(400),
        decoration: BoxDecoration(

          color: style.Colors.titleColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurRadius: 5,
              color: Colors.grey
              ),
              
          ]

              
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
               // margin: EdgeInsets.only(),
                height: ScreenUtil().setHeight(120),
                 width: ScreenUtil().setWidth(100),
                 decoration: BoxDecoration(

          color: style.Colors.titleColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: CachedNetworkImageProvider(widget.product.imageUrlProduct),
            fit: BoxFit.fill
            )
              
        ),
                 
                 ),
                 
            ),
            



            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: 140,
                            child: Text(widget.product.titleProduct , style: TextStyle(
                              color: style.Colors.mainColor,
                              fontWeight: FontWeight.bold
                            ),)),
                          IconButton(icon: Icon(Icons.favorite_border),
                           onPressed: (){}),
                           IconButton(icon: Icon(Icons.delete),
                           onPressed: (){
                             Provider.of<ECProvider>(context,listen: false).deleteProductCart(widget.product);
                             Navigator.of(context).push(MaterialPageRoute(
                               builder: (context)=>SuccessScreen()));
                           })
                        ],
                      )
                    ),


                    Expanded(
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                              child: Container(
                              width: 140,
                              child: Text(widget.product.price.toString() , style: TextStyle(
                                color: style.Colors.secondColor,
                                fontWeight: FontWeight.bold
                              ),)),
                          ),


                            Expanded(
                              flex: 3,
                                child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                width: ScreenUtil().setWidth(150),
                                height: ScreenUtil().setHeight(40),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      blurRadius: 3,
                                      color: Colors.grey
                                    )
                                  ]
                                ),
                                child: Consumer<ECProvider>(
                                  builder: (context, value, child) {
                                    //int total = value.totalCart;
                                    return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                        width: 30,
                                        child: IconButton(icon: Icon(Icons.add),
                                         onPressed: (){
                                           setState(() {
                                             count++;
                                           });
                                          
                                            myProvider.settotalCart(widget.product.price);
                                         }
                                         )),
                                      Container(
                                        
                                        width: 50,
                                        child: Text(count.toString() , textAlign: TextAlign.center,),
                                        ),
                                        Container(
                                        width: 30,
                                        child: IconButton(icon: Icon(Icons.remove),
                                         onPressed: (){
                                           if(count != 0){
                                             count--;
                                             myProvider.settotalCartDe(widget.product.price);
                                           }
                                           setState(() {
                                             
                                           });
                                            
                                         })),
                                    ],
                                  );
                                  },
                                
                                ),
                              ),
                            )

                        ],
                      )
                      ),
                  ],
                ),
              )
              )
          ],
        ),

        
      );
      },
       
    );
  }
}