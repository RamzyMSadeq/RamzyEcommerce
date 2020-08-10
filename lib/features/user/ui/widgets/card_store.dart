import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_project/features/user/ui/Screens/profile_trader.dart';
import 'package:e_commerce_project/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:google_fonts/google_fonts.dart';

class CardStore extends StatelessWidget {
  String urlImg;
    String storName;
    UserModel myStore;
    CardStore(this.urlImg , this.storName , this.myStore);
  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      height: ScreenUtil().setHeight(200),
                      width: ScreenUtil().setWidth(400),
                      decoration: BoxDecoration(
                        //color: Colors.red,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          
                        ),
                        image: urlImg == null 
                        ?
                           DecorationImage(
                          image: AssetImage('assets/images/csh.jpg'),
                          fit: BoxFit.fill
                        )
                        :
                         DecorationImage(
                          image: CachedNetworkImageProvider(myStore.imgProfile),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: ScreenUtil().setHeight(200),
                      width: ScreenUtil().setWidth(400),
                      decoration: BoxDecoration(
                        color: Colors.black54.withOpacity(.6),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          
                        ),
                        
                      ),
                      
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 280 , top: 21),
                      height: ScreenUtil().setHeight(40),
                      width: ScreenUtil().setWidth(110),
                      decoration: BoxDecoration(
                        color: style.Colors.titleColor.withOpacity(.7),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            blurRadius: 20,
                            color: Colors.grey,

                          )
                        ]
                      ),
                      child: Center(child: Text('Follow' , style: TextStyle(
                        color: style.Colors.mainColor,
                        fontWeight: FontWeight.w700,
                        
                      ),)),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 280 , top: 75),
                      height: ScreenUtil().setHeight(40),
                      width: ScreenUtil().setWidth(110),
                      decoration: BoxDecoration(
                        color: style.Colors.titleColor.withOpacity(.7),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            blurRadius: 20,
                            color: Colors.grey,

                          )
                        ]
                      ),
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder:
                             (context)=>ProfileTrader(myStore))
                          );

                        },
                          child: Center(child: Text('Profile' , style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w700,
                          
                        ),)),
                      ),
                    ),
                    Container(
                      
                      margin: EdgeInsets.only(left: 20,top: 130),
                      alignment: Alignment.centerLeft,

                      child: Text(myStore.name , style: GoogleFonts.poppins(
                        color:style.Colors.titleColor.withOpacity(.8),
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        letterSpacing: 1
                         ),)
                    )
                    
                  ],
                ) ,
      
    );
  }
}