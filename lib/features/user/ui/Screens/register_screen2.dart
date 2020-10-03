import 'package:e_commerce_project/features/user/ui/widgets/registerTrader.dart';
import 'package:e_commerce_project/features/user/ui/widgets/register_user.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:flutter_screenutil/screenutil.dart';


class RegisterScreens2 extends StatefulWidget {
  @override
  _RegisterScreens2State createState() => _RegisterScreens2State();
}

class _RegisterScreens2State extends State<RegisterScreens2> with SingleTickerProviderStateMixin {
  TabController tabController ;
  int isSelected =0;
  GlobalKey<FormState> globalKey = GlobalKey();
  GlobalKey<FormState> globalKey2 = GlobalKey();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this , initialIndex: 0);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,

       body: Container(
        //margin: EdgeInsets.all(30),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: <Widget>[

            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                ClipPath(
              clipper: MyClippe(),
                      child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/3.3,
                      decoration: BoxDecoration(
                        
                        color: style.Colors.mainColor,
                        
                      ),
                      
                    ),
                    
                          ),
                          Container(
                            height: ScreenUtil().setHeight(230),
                            alignment: Alignment.center,
                            child: Image.asset(style.Image.urlLogo )),

                            Positioned(
                              bottom: -80,
                              left: 50,
                              child:GestureDetector(
                                onTap: (){
                                  isSelected = 0 ; 
                                  setState(() {
                                    
                                  });
                                  tabController.animateTo(0);
                                },
                                                              child: Container(
                                  height: 150,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color:  isSelected==0 ?style.Colors.secondColor : Colors.white,
                                    borderRadius:BorderRadius.only(
                                      topRight: Radius.circular(30),
                                
                                bottomLeft: Radius.circular(30),
                                
                            ) ,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          blurRadius: 8,
                          color: Colors.grey[500],
                          offset: Offset(1, 3)
                        )
                      ]
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Image.asset('assets/images/client.png' , width: 70, ),
                                      Text("User" , style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: isSelected==0 ? style.Colors.titleColor : style.Colors.mainColor
                                      ),)
                                    ],
                                  ),
                                ),
                              )
                               ),
                               Positioned(
                              bottom: -80,
                              right: 50,
                              child:GestureDetector(
                                onTap: (){
                                  isSelected = 1;
                                  setState(() {
                                    
                                  });
                                  tabController.animateTo(1);
                                },
                                  child: Container(
                                  height: 150,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: isSelected==1 ?style.Colors.secondColor : Colors.white,
                                    borderRadius:BorderRadius.only(
                                      topRight: Radius.circular(30),
                                
                                bottomLeft: Radius.circular(30),
                                
                            ) ,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          blurRadius: 8,
                          color: Colors.grey[500],
                          offset: Offset(1, 3)
                        )
                      ]
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Image.asset('assets/images/store.png' , width: 70, ),
                                      Text("Trader" , style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: isSelected==1 ? style.Colors.titleColor : style.Colors.mainColor
                                      ),)
                                    ],
                                  ),
                                ),
                              )
                               ),
              ],),
              Container(
               // margin: EdgeInsets.only(top: 10),
                height: 590,
                //color: Colors.red,
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: [
                    //Container(color: Colors.red,),
                    
                    //Container(color: Colors.yellowAccent),
                    RegisterUser(globalKey),
                    RegisterTrader(),

                  ]),
              )

          ],

        
        ),

       )
      
    );
  }
}

 class MyClippe extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0,size.height-60 );
    path.quadraticBezierTo(size.width/4, size.height-20, size.width/2, size.height-5);
    path.quadraticBezierTo(size.width-(size.width/4), size.height+10, size.width, size.height-40);
    path.lineTo(size.width, 0.0);

     return path;
    }
  
    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}