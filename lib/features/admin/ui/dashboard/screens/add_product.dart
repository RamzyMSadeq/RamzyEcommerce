import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_project/features/admin/providers/admin_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  bool _lights = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF282930),
      body: Consumer<AdminProvider>(
        builder: (context, value, child) {
          String imageurl = value.imageUrl;
           value.currentUserId();
           FirebaseUser fireUser = value.currentUser;
          return Container(
          height: ScreenUtil().setHeight(800),
          width: ScreenUtil().setWidth(411),
          child: ListView(
            children: <Widget>[
              Container(
                height: ScreenUtil().setHeight(120),
                width: ScreenUtil().setWidth(411),
                child: Center(
                  child: Text(
                    "Add New Product",
                    style: GoogleFonts.poppins(
                      color: style.Colors.titleColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                //  color: Colors.white,
                height: ScreenUtil().setHeight(150),
                width: ScreenUtil().setWidth(380),

                child: Row(
                  children: <Widget>[
                    imageurl == null
                    ?
                    Expanded(
                        flex: 2,
                        child: Container(
                          width: ScreenUtil().setWidth(100),
                          decoration: BoxDecoration(
                            color: Color(0xFF353642),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 40),
                                child: IconButton(
                                    icon: Icon(
                                      Icons.add_a_photo,
                                      size: 70,
                                      color: Colors.white,
                                    ),
                                    onPressed: ()async {
                                      PickedFile imageFile= await
                                      ImagePicker().getImage(source: ImageSource.gallery);
                                      File file = File(imageFile.path);
                                      value.uploadImage(file , 'products');
                                    }),
                              ),
                              Container(
                                  child: Text(
                                'Add Photo',
                                style: GoogleFonts.poppins(
                                  color: style.Colors.titleColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))
                            ],
                          ),
                        ))
                        :
                        Container(
                          width: ScreenUtil().setWidth(150),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(imageurl),
                              fit: BoxFit.cover
                              )
                          ),
                        ),
                    SizedBox(
                      width: ScreenUtil().setWidth(20),
                    ),
                    Expanded(
                        flex: 3,
                        child: Container(
                          height: ScreenUtil().setHeight(150),
                          padding: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            color: Color(0xFF353642),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: ScreenUtil().setHeight(70),
                                child: TextFormField(
                                  onChanged: (valueT) {
                                    value.setTitle(valueT);
                                  },
                                  
                                  style: TextStyle(
                                    
                                      height: ScreenUtil().setHeight(.7),
                                      fontSize: 15,
                                      color: Colors.white,
                                      decorationColor: Colors.white),
                                  cursorColor: style.Colors.mainColor,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(color: Colors.white54),
                                    hintText: 'title',
                                    prefixIcon: Icon(
                                      Icons.add,
                                      color: Colors.white54,
                                      size: 30,
                                    ),
                                    focusColor: style.Colors.mainColor,
                                    hoverColor: style.Colors.mainColor,
                                  ),
                                ),
                              ),
                              Container(
                                height: ScreenUtil().setHeight(60),
                                child: TextFormField(
                                   onChanged: (valueT) {
                                    value.setPrice(valueT);
                                  },
                                  
                                  style: TextStyle(
                                      height: ScreenUtil().setHeight(.7),
                                      fontSize: 15,
                                      color: Colors.white,
                                      decorationColor: Colors.white),
                                  cursorColor: style.Colors.mainColor,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(color: Colors.white54),
                                    hintText: 'Price',
                                    prefixIcon: Icon(
                                      Icons.add,
                                      color: Colors.white54,
                                      size: 30,
                                    ),
                                    focusColor: style.Colors.mainColor,
                                    hoverColor: style.Colors.mainColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xFF353642),
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: TextFormField(
                   onChanged: (valueT) {
                      value.setCategory(valueT);
                    },
                                  
                  maxLines: 5,
                  style: TextStyle(
                      height: ScreenUtil().setHeight(.7),
                      fontSize: 15,
                      color: Colors.white,
                      decorationColor: Colors.white),
                  cursorColor: style.Colors.mainColor,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white54),
                    hintText: 'Category',
                    prefixIcon: Icon(
                      Icons.add,
                      color: Colors.white54,
                      size: 30,
                    ),
                    focusColor: style.Colors.mainColor,
                    hoverColor: style.Colors.mainColor,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: ScreenUtil().setHeight(60),
                decoration: BoxDecoration(
                  color: Color(0xFF353642),
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: TextFormField(
                   onChanged: (valueT) {
                    value.setSubCategory(valueT);
                   },
                                  
                  maxLines: 5,
                  style: TextStyle(
                      height: ScreenUtil().setHeight(.7),
                      fontSize: 15,
                      color: Colors.white,
                      decorationColor: Colors.white),
                  cursorColor: style.Colors.mainColor,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white54),
                    hintText: 'SubCategory',
                    prefixIcon: Icon(
                      Icons.add,
                      color: Colors.white54,
                      size: 30,
                    ),
                    focusColor: style.Colors.mainColor,
                    hoverColor: style.Colors.mainColor,
                  ),
                ),
              ),
              
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                height: ScreenUtil().setHeight(70),
                decoration: BoxDecoration(
                  color: Color(0xFF353642),
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: MergeSemantics(
                  child: ListTile(
                    title: Text(
                      'isOffer',
                      style: GoogleFonts.poppins(
                        color: style.Colors.titleColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: CupertinoSwitch(
                      trackColor: Colors.white54,
                      value: _lights,
                      onChanged: (bool value1) {
                         value.setIsOffer(value1);
                        
                        setState(() {
                          _lights = value1;
                        });
                      },
                    ),
                    onTap: () {
                      setState(() {
                        
                        _lights = !_lights;
                       
                      });
                    },
                  ),
                ),
              ),
              _lights == true
                  ? Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: ScreenUtil().setHeight(60),
                decoration: BoxDecoration(
                  color: Color(0xFF353642),
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: TextFormField(
                  onChanged: (valueT) {
                    value.setDiscount(valueT);
                   },
                  maxLines: 5,
                  style: TextStyle(
                      height: ScreenUtil().setHeight(.7),
                      fontSize: 15,
                      color: Colors.white,
                      decorationColor: Colors.white),
                  cursorColor: style.Colors.mainColor,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white54),
                    hintText: 'dscount',
                    prefixIcon: Icon(
                      Icons.add,
                      color: Colors.white54,
                      size: 30,
                    ),
                    focusColor: style.Colors.mainColor,
                    hoverColor: style.Colors.mainColor,
                  ),
                ),
              )
                  : Container(),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                width: ScreenUtil().setWidth(390),
                height: ScreenUtil().setHeight(60),
                decoration: BoxDecoration(
                  color: style.Colors.mainColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: FlatButton(
                  onPressed: ()async{
                    value.setStorId(fireUser.uid);
                    value.setRating('5');
                    value.setIndicator(true);
                    await value.addNewProduct();
                    value.setIndicator(false);


                    var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: Colors.green,
      ),
    );
      Alert(
      context: context,
      style: alertStyle,
      type: AlertType.success,
      title: "Successfull",
      desc: "the add process is Done ",
      buttons: [
        DialogButton(
          child: Text(
            "Done!",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
             
            value.setImageUrl(null);
            value.setTitle('');
            value.setPrice('0');
            value.setCategory('');
            value.setSubCategory('');
            value.setIsOffer(false);
            value.setDiscount('0');
              Navigator.pop(context);

           

          } ,
          color: Color.fromRGBO(0, 179, 134, 1.0),
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
                  },
                   child: Text('Add Product',style: GoogleFonts.poppins(
                                  color: style.Colors.titleColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),)),

                  ),
                  value.indecator == true
                  ?
                  Center(child: CircularProgressIndicator(),)
                  :
                  Container()
            ],
          ),
        );
        },
      
      ),
    );
  }
}
