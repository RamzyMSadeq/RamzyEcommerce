import 'package:e_commerce_project/features/user/Provider/e_c_provider.dart';
import 'package:e_commerce_project/features/user/ui/Screens/orders_status.dart';
import 'package:e_commerce_project/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllOrders extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

     ECProvider ecProvider = Provider.of<ECProvider>(context);
     ecProvider.getAllOrder();
     
     
    return Scaffold(
      appBar: AppBar(
        title: Text('All Orders'),
        centerTitle: true,
        elevation: 0,
        backgroundColor:style.Colors.mainColor ,
      ),

      body: Column(
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
              height: ScreenUtil().setHeight(70),
              width: double.infinity,
              color: style.Colors.mainColor,
            ),
            Positioned(
              left: 30,
              bottom: -30,
              child: Container(
                width: ScreenUtil().setWidth(350),
                height: ScreenUtil().setHeight(60),
                decoration: BoxDecoration(
                   borderRadius: BorderRadius.all(Radius.circular(25)),
                
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search a Store',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    
                    filled: true,
                    fillColor: style.Colors.titleColor

                  ),
                ),
              )
            )
            ],
          ),
          SizedBox(height: 40,),
       
          Consumer<ECProvider>(
            builder: (context, value, child) {
              value.getAllOrder();
              List<Order> myOrders = value.allOrder;
              
             
              return myOrders != null 
              ?
              Container(
              height: ScreenUtil().setHeight(585),
              child: ListView.builder(
                itemCount: myOrders.length,
                itemBuilder: (context, index) {
            // List<CartModel> myorderModel= myOrders[index].orders;
              return InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=>OrdersStatus(value.allOrder[index].orders)));
                },
                              child: Container(
                  margin: EdgeInsets.all(20),
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    //border: Border.all()
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.grey
                      )
                    ]
                  ),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text('Id Order : ' , style: GoogleFonts.poppins(
                                 fontSize: 13,
                                 fontWeight: FontWeight.bold,

                                  ),) ,
                            Text(myOrders[index].documentId)
                          ],
                        ),
                         Row(
                          children: <Widget>[
                            Text('Price Order : ' , style: GoogleFonts.poppins(
                                 fontSize: 13,
                                 fontWeight: FontWeight.bold,

                                  ),) ,
                            Text(myOrders[index].totalPrice)
                          ],
                        ),
                         Row(
                          children: <Widget>[
                            Text('Address Order : ' , style: GoogleFonts.poppins(
                                 fontSize: 13,
                                 fontWeight: FontWeight.bold,

                                  ),) ,
                            Text(myOrders[index].address)
                          ],
                        ),
                        Text(myOrders[index].date)
                      ],
                    ),
                  )
                ),
              );
                  
                  
                },),
            )
            :
            Center(child: CircularProgressIndicator());
            },
            
          )
          
        ],
      ),
      
      
      
      
    );
  }
}


