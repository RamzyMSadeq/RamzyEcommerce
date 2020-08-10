import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;

class CardAddProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.all(5),
          height: 540,
          
          decoration: BoxDecoration(
            //color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: Colors.grey),
            boxShadow: <BoxShadow>[
              
            ]


          ),
        
          child: Column(
            
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                width: 400,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                        child: Row(
                        children: <Widget>[
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              //color: style.Colors.mainColor,
                              shape: BoxShape.circle,
                              image: DecorationImage(image: AssetImage("assets/images/profilemahdi.jpg"), 
                      fit: BoxFit.cover
                      )
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              children: <Widget>[
                                Text("Al Mahdi Center" , textAlign: TextAlign.start, style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 17
                                ),),
                                Container(
                                  alignment: Alignment.topLeft,
                                  margin: EdgeInsets.only(right: 110),
                                  child: Text("1h", textAlign: TextAlign.start,style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 14,
                                   color: Colors.grey[600]
                                ),))
                              ],
                            ),
                          )
                          
                        ],
                      ),
                    ),
                    Expanded(
                      child: IconButton(icon: Icon(Icons.settings , color: Colors.grey,), onPressed: (){}),
                    )
                  ],
                ) ,
              ),
              Container(
                margin: EdgeInsets.only(left: 20 , right: 20),
                height: 80,
                child: Text("This is a high-heeled, Nike brandTo order, please contact us",
                style: TextStyle(
                  fontSize: 16
                ),
                ),
                
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 320,
               decoration: BoxDecoration(
            
            borderRadius: BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(image: AssetImage('assets/images/heelscategory.png'),
            fit: BoxFit.fill
            )



          ),
              
              ),
              Divider(thickness: 2,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.favorite_border , size: 25,), onPressed: (){}),
                    IconButton(icon: Icon(Icons.comment, size: 25,), onPressed: (){}),
                    IconButton(icon: Icon(Icons.share, size: 25,), onPressed: (){}),
                  ],
                ),
              )
              

            ],
          ),
        );
  }
}