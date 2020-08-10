import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_project/features/admin/providers/admin_provider.dart';
import 'package:e_commerce_project/features/user/Provider/e_c_provider.dart';
import 'package:e_commerce_project/features/user/ui/widgets/card_store.dart';
import 'package:e_commerce_project/features/user/ui/widgets/flash_sale.dart';
import 'package:e_commerce_project/models/product_model.dart';
import 'package:e_commerce_project/models/userModel.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:e_commerce_project/models/cart_model.dart';


class ProductProfile extends StatefulWidget {
  final ProductModel productDe;
  final int index1 ;
  final String hero;
  
  ProductProfile({this.productDe ,this.index1 , this.hero});

  @override
  _ProductProfileState createState() => _ProductProfileState();
}

class _ProductProfileState extends State<ProductProfile> {

  bool isLiked=false;
  bool isSelectedSize=false;
  int ind=0;
  bool isSelectedColor=false;
  int ind2=0;

  List<double> listSize =[6 , 6.5 , 7,7.5,8,8.5,9,9.5,10];
  List<Color> listColors = [
    Colors.red ,
     Colors.blue ,
      Colors.green ,
       Colors.black ,
        Colors.deepPurple,
        Colors.yellow[900],
        Colors.pinkAccent,


        
        ];

  setLiked(){
    this.isLiked = !isLiked;
    setState(() {
      
    });
  }
  setSelectedSize(){
    this.isSelectedSize = !isSelectedSize;
    setState(() {
      
    });
  }
  @override
  void initState() { 
    print("gggggggggggggg ${widget.productDe.storeId}");
    super.initState();
    
  }

  Widget getIcon(){
    if(isLiked==false){
      return Icon(EvaIcons.heartOutline,size: 40,);
    }else{
      return Icon(EvaIcons.heart,size: 40, color: Colors.red,);
    }
  }

  @override
  Widget build(BuildContext context) {
    ECProvider ecProvider = Provider.of<ECProvider>(context , listen: false);

    return Scaffold(
      //appBar: AppBar(title: Text('splash'),),
       body: Consumer<AdminProvider>(
         builder: (context, value, child) {
           return Column(
           children: <Widget>[
             Container(
           height: ScreenUtil().setHeight(800),
           child: ListView(
      children: <Widget>[
          
            //transitionOnUserGestures: true,
              SizedBox(
                height: ScreenUtil().setHeight(430),
                  child: Row(
                  children: <Widget>[

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            padding: EdgeInsets.symmetric(horizontal:10),
                            icon: Icon(Icons.arrow_back),
                             onPressed: (){
                               Navigator.of(context).pop();
                             }),
                        ),
                        Spacer(),
                        IconCard(widget.productDe.imageUrl,),
                        IconCard(widget.productDe.imageUrl,),
                       IconCard(widget.productDe.imageUrl,),
                        IconCard(widget.productDe.imageUrl,),
                        
                      ],
                    )),

                    


                    Hero(
                      tag:widget.hero+widget.index1.toString() ,
                                      child: Container(
                        height: ScreenUtil().setHeight(430),
                        width: ScreenUtil().setWidth(300),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(65),
                            bottomLeft: Radius.circular(65)
                          ),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              blurRadius: 60,
                              color: style.Colors.mainColor.withOpacity(.29),
                              offset: Offset(1, 10)

                            )
                          ],
                          image: DecorationImage(
                            alignment: Alignment.centerLeft,
                            image: CachedNetworkImageProvider(widget.productDe.imageUrl),
                            fit: BoxFit.fill
                             ),

                        ),

                      ),
                    )
                  ],
                ),
              ),
          
          SizedBox(height: 10,),
          Container(
            margin: EdgeInsets.only(left: 15),
            width: ScreenUtil().setWidth(300),
            height: ScreenUtil().setHeight(80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 5,
          child: Text("${widget.productDe.title} " , textAlign: TextAlign.left, style: GoogleFonts.poppins(
          color: Colors.black87,
          fontSize: 20,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w700,
          height: 1.5 /*PERCENT not supported*/
      ),),
                ),

      Expanded(child: IconButton(
          icon: getIcon(),
              onPressed: (){
               setLiked();
             })),

              ],
            ),
            
          ),
          SizedBox(height: 10,),
          Container(
           margin: EdgeInsets.only(left: 15),
           width: ScreenUtil().setWidth(160),
                 
            child: SmoothStarRating(
            allowHalfRating: true,
            onRated: (v) {
             },
            starCount: 5,
            rating: 3,
            size: 30.0,
            isReadOnly:true,
            color: Colors.yellow[600],
            borderColor: Colors.grey,
            spacing:0.0
    )
            
              ),
              SizedBox(height: 10,),

              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text('${widget.productDe.price}\$' , textAlign: TextAlign.left, style: GoogleFonts.poppins(
          color: style.Colors.mainColor,
          fontSize: 20,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w700,
          height: 1.5 /*PERCENT not supported*/
      ))),

      SizedBox(height: 10,),
      Container(
          height: ScreenUtil().setHeight(120),
          width: ScreenUtil().setWidth(380),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15),
                alignment: Alignment.topLeft,
                child: Text('Select Size' , textAlign: TextAlign.start, style: GoogleFonts.poppins(
                 color: style.Colors.secondColor,
                 fontSize: 14,
                 letterSpacing: 0.5,
                 fontWeight: FontWeight.w700,
                 height: 1.5 /*PERCENT not supported*/
      )),
              ),
      Container(
          //margin: EdgeInsets.only(left: 15),
          alignment: Alignment.center,
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:listSize.length ,
            itemBuilder: (context , index){
              return GestureDetector(
                onTap: (){
                  ind = index;
                  setState(() {
                    
                  });

                  isSelectedSize=true;

                },
                 child: Container(
                  margin: EdgeInsets.only(left: 15),
                  width: ScreenUtil().setWidth(60),
                  height: ScreenUtil().setHeight(60),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      
                      color: isSelectedSize == true&& ind==index ? style.Colors.mainColor
                       : Colors.transparent
                      )
                      
                      
                   ),
                   child: Center(child: Text(listSize[index].toString() , textAlign: TextAlign.center,style: GoogleFonts.poppins(
                 color: Colors.black87,
                 fontSize: 14,
                 letterSpacing: 0.5,
                 fontWeight: FontWeight.w700,
                 height: 1.5 /*PERCENT not supported*/
      ))),
                ),
              );
            },
          ),
      )
              
            ],
          ),
      ),
      //SizedBox(height: 10,),
      Container(
          height: ScreenUtil().setHeight(120),
          width: ScreenUtil().setWidth(380),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15),
                alignment: Alignment.topLeft,
                child: Text('Select Color' , textAlign: TextAlign.start, style: GoogleFonts.poppins(
                 color: style.Colors.secondColor,
                 fontSize: 14,
                 letterSpacing: 0.5,
                 fontWeight: FontWeight.w700,
                 height: 1.5 /*PERCENT not supported*/
      )),
              ),
      Container(
          //margin: EdgeInsets.only(left: 15),
          alignment: Alignment.center,
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:listColors.length ,
            itemBuilder: (context , index){
              return GestureDetector(
                onTap: (){
                 ind2=index;
                 setState(() {
                   
                 });
                 isSelectedColor=true;
                 
                },
                 child: Container(
                  margin: EdgeInsets.only(left: 15),
                  width: ScreenUtil().setWidth(60),
                  height: ScreenUtil().setHeight(60),
                  decoration: BoxDecoration(
                    color: listColors[index],
                    shape: BoxShape.circle,
                      
                   ),
                   child: Center(
                     
                     child: isSelectedColor==true && ind2==index ?
                     Icon(Icons.brightness_1, color:Colors.white,)
                     : Container()
                   ),
                ),
              );
            },
          ),
      ),
     
              
            ],
          ),
      ),
         Container(
           
          margin: EdgeInsets.all(15),
          width: ScreenUtil().setWidth(345),
          height: ScreenUtil().setHeight(300),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: Text('Specification' , textAlign: TextAlign.start, style: GoogleFonts.poppins(
                   color: style.Colors.mainColor,
                   fontSize: 14,
                   letterSpacing: 0.5,
                   fontWeight: FontWeight.w700,
                   height: 1.5 /*PERCENT not supported*/
      )),
              ),
            Container(
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                  
                    flex: 2,
                     child: Text('Shown:' , textAlign: TextAlign.start, style: GoogleFonts.poppins(
                     color: style.Colors.mainColor,
                     fontSize: 12,
                     letterSpacing: 0.5,
                     fontWeight: FontWeight.w700,
                     height: 1.5 /*PERCENT not supported*/
                     )),
                  ),

                   Expanded(
                                      child: Text('Laser Blue/Anthracite/Watermelon/White' , textAlign: TextAlign.start, style: GoogleFonts.poppins(
                     color: style.Colors.hintColor,
                     fontSize: 12,
                     letterSpacing: 0.5,
                     fontWeight: FontWeight.w700,
                     height: 1.5 /*PERCENT not supported*/
                     )),
                   ),

                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                  
                    flex: 2,
                     child: Text('Style:' , textAlign: TextAlign.start, style: GoogleFonts.poppins(
                     color: style.Colors.mainColor,
                     fontSize: 12,
                     letterSpacing: 0.5,
                     fontWeight: FontWeight.w700,
                     height: 1.5 /*PERCENT not supported*/
                     )),
                  ),

                   Expanded(
                                      child: Text('CD0113-400' , textAlign: TextAlign.start, style: GoogleFonts.poppins(
                     color: style.Colors.hintColor,
                     fontSize: 12,
                     letterSpacing: 0.5,
                     fontWeight: FontWeight.w700,
                     height: 1.5 /*PERCENT not supported*/
                     )),
                   ),

                ],
              ),
            ),
            SizedBox(height: 15,),
            
            SizedBox(height: 15,),
            Container(
              child: Text('The Nike Air Max 270 React ENG combines a full-length React foam midsole with a 270 Max Air unit for unrivaled comfort and a striking visual experience.' , textAlign: TextAlign.start, style: GoogleFonts.poppins(
                     color: style.Colors.hintColor,
                     fontSize: 12,
                     letterSpacing: 0.5,
                     fontWeight: FontWeight.w500,
                     height: 1.5 /*PERCENT not supported*/
                     )),
            )
            

            ],
          ),
      ),
      Consumer<ECProvider>(
        builder: (context, value, child) {
          value.getStoreById(widget.productDe.storeId);
          UserModel myStoreM = value.profileStore;
          return Container(
              
                child: CardStore(
                  'assets/images/almahdi.jpg',
                   'Jawad Mahdi Store',
                    myStoreM
                   ));
        },
        
      ),

      Container(
          //color: Colors.red,
          margin: EdgeInsets.all(15),
          width: ScreenUtil().setWidth(345),
          height: ScreenUtil().setHeight(480),
          child: Column(
            children: <Widget>[
              Container(
              //width: ScreenUtil().setWidth(370),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                   Text(
                      'Review Product',
                      style: GoogleFonts.poppins(
                          color: style.Colors.mainColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'See More',
                      style: GoogleFonts.poppins(
                          color: style.Colors.secondColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              child: Row(
                children: <Widget>[
                  Container(
           //margin: EdgeInsets.only(left: 15),
           width: ScreenUtil().setWidth(160),
                 
            child: SmoothStarRating(
            allowHalfRating: true,
            onRated: (v) {
             },
            starCount: 5,
            rating: 3.5,
            size: 30.0,
            isReadOnly:true,
            color: Colors.yellow[600],
            borderColor: Colors.grey,
            spacing:0.0
    )
            
              ),
              Text('4.5', textAlign: TextAlign.start, style: GoogleFonts.poppins(
                     color: style.Colors.hintColor,
                     fontSize: 10,
                     letterSpacing: 0.5,
                     fontWeight: FontWeight.w500,
                     height: 1.5 /*PERCENT not supported*/
                     )),
              Text(' (5 Review)', textAlign: TextAlign.start, style: GoogleFonts.poppins(
                     color: style.Colors.hintColor,
                     fontSize: 10,
                     letterSpacing: 0.5,
                     fontWeight: FontWeight.w500,
                     height: 1.5 /*PERCENT not supported*/
                     ))
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage('assets/images/logoIcon.png'))
                    ),
                  ),
                  SizedBox(width: 15,),
                  Column(
                    children: <Widget>[
                      Text(
                      'Review Product',
                      style: GoogleFonts.poppins(
                          color: style.Colors.titleColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
           margin: EdgeInsets.only(right: 25),
           //width: ScreenUtil().setWidth(160),
                 
            child: SmoothStarRating(
            allowHalfRating: true,
            onRated: (v) {
             },
            starCount: 5,
            rating: 3,
            size: 25.0,
            isReadOnly:true,
            color: Colors.yellow[600],
            borderColor: Colors.grey,
            spacing:0.0
    )
            
              ),


                    ],
                  )
                ],
              ),
              
            ),
            SizedBox(height: 15,),
            Container(
              child: Text('air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.' , textAlign: TextAlign.start, style: GoogleFonts.poppins(
                     color: style.Colors.hintColor,
                     fontSize: 12,
                     letterSpacing: 0.5,
                     fontWeight: FontWeight.w500,
                     height: 1.5 /*PERCENT not supported*/
                     )),
            ),
            SizedBox(height: 15,),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                   // image: DecorationImage(image: AssetImage(widget.product.imageUrl),fit: BoxFit.cover)

                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                   // image: DecorationImage(image: AssetImage(widget.product.imageUrl),fit: BoxFit.cover)

                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                 //   image: DecorationImage(image: AssetImage(widget.product.imageUrl),fit: BoxFit.cover)

                  ),
                ),

              ],
            ),

            Container(
              margin: EdgeInsets.only(top: 15),
              alignment: Alignment.topLeft,
              child: Text(
                        'December 10, 2016',
                        style: GoogleFonts.poppins(
                            color: style.Colors.hintColor,
                            fontSize: 10,
                            letterSpacing: .5,
                            fontWeight: FontWeight.normal),
                      ),
            ),
           
            ],
          ),
      ),
      FlashSale('You Might Also Like'),
      
      SizedBox(height: 50,)


      ],
      
    ),
         ),

         InkWell(
          onTap: (){
            
          //  ecProvider.getStoreById(widget.productDe.storeId);
           // UserModel myStoreM = ecProvider.profileStore;
            Provider.of<ECProvider>(context, listen: false).insertNewCartProduct(
              CartModel(
                userId: Provider.of<ECProvider>(context, listen: false).currentid ,
                traderId: widget.productDe.storeId,
                productId: "651",
                imageUrlProduct: widget.productDe.imageUrl,
                titleProduct:  widget.productDe.title,
                price: widget.productDe.price

               )
            );

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
                child: Container(
            margin: EdgeInsets.only(left: 15 , right: 15 , top: 3),
            width: ScreenUtil().setWidth(345),
            height: ScreenUtil().setHeight(60),
            decoration: BoxDecoration(
              color: style.Colors.mainColor,
              borderRadius: BorderRadius.all(Radius.circular(5)),
             
              
            ),
            child: Center(child:Text(
                          'Add To Cart',
                          style: GoogleFonts.poppins(
                              color: style.Colors.titleColor,
                              fontSize: 18,
                              letterSpacing: .5,
                              fontWeight: FontWeight.bold),
                        ),),
          ),
      ),


           ],
         );         },
       )
    );
  }
}

class IconCard extends StatelessWidget {
  String imgUrl;
  IconCard(this.imgUrl);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      
                        height: ScreenUtil().setHeight(62),
                        width: ScreenUtil().setWidth(62),
                        decoration: BoxDecoration(
                          color: style.Colors.titleColor,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              offset: Offset(1, 15),
                              blurRadius: 22,
                              color: Colors.grey.withOpacity(.4)
                            ),
                            BoxShadow(
                              offset: Offset(-15, -15),
                              blurRadius: 20,
                              color: style.Colors.titleColor
                            )
                          ],
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(imgUrl),
                            fit: BoxFit.cover
                          )
                        ),
                      );
  }
}