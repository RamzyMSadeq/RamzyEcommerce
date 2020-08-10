import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_project/features/user/Provider/e_c_provider.dart';
import 'package:e_commerce_project/models/cart_model.dart';
import 'package:e_commerce_project/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:provider/provider.dart';

class OrdersStatus extends StatelessWidget {
  List<Map<String, dynamic>> myCart;
  OrdersStatus(this.myCart);
  List<CartModel> myModel;
  @override
  Widget build(BuildContext context) {
    myModel = myCart.map((e) => CartModel.fromJson(e)).toList();
    ECProvider ecProvider = Provider.of<ECProvider>(context);

    return Scaffold(
      body: myModel != null 
      ?
      Container(
        height: ScreenUtil().setHeight(900),
        child: ListView(
          
          padding: EdgeInsets.only(top: 70, left: 20, right: 20),
          
          children: <Widget>[
            Text(
              'Order Status',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
                padding: EdgeInsets.only(left: 20, top: 20),
                height: ScreenUtil().setHeight(130),
                child: Stack(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: style.Colors.mainColor,
                              radius: 30,
                              child: Icon(
                                Icons.card_giftcard,
                                size: 35,
                                color: style.Colors.titleColor,
                              ),
                            ),
                            Text("Orderd\n Placed",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ))
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: style.Colors.secondColor,
                              radius: 30,
                              child: Icon(
                                Icons.local_car_wash,
                                size: 35,
                                color: style.Colors.titleColor,
                              ),
                            ),
                            Text(" In Transit",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ))
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: style.Colors.hintColor,
                              radius: 30,
                              child: Icon(
                                Icons.check,
                                size: 35,
                                color: style.Colors.titleColor,
                              ),
                            ),
                            Text("Compleated",
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  fontWeight: FontWeight.normal,
                                ))
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      top: 27,
                      left: 60,
                      child: Container(
                        height: 5,
                        width: 70,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            gradient: LinearGradient(colors: [
                              style.Colors.mainColor,
                              style.Colors.secondColor
                            ], stops: [
                              0,
                              .7
                            ])),
                      ),
                    ),
                    Positioned(
                      top: 27,
                      left: 190,
                      child: Container(
                        height: 5,
                        width: 86,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: style.Colors.hintColor),
                      ),
                    )
                  ],
                )),
            Container(
              height: 800,
              child: ListView.builder(
                itemCount: myModel.length,
                itemBuilder: (context, index) {
                  ecProvider.getStoreById(myModel[index].traderId);
                  UserModel myStoreM = ecProvider.profileStore;
                  return myStoreM != null
                  ?
                  Container(
                    //margin: EdgeInsets.only(top: 20, left: 25, right: 25),
                    height: 300,
                    color: Colors.grey[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: 180,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      myModel[index].imageUrlProduct),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30))),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Product Name :',
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        color: style.Colors.mainColor,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  Text(myModel[index].titleProduct,
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ))
                                ],
                              ),
                              Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Product Price :',
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        color: style.Colors.mainColor,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  Text('${myModel[index].price.toString()}\$',
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ))
                                ],
                              ),
                              Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Product Store :',
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        color: style.Colors.mainColor,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  Text('${myStoreM.name}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                  :
                  Center(child: CircularProgressIndicator());
                },
              ),
            )
          ],
        ),
      )
      :
      Center(child: CircularProgressIndicator())
    );
  }
}
