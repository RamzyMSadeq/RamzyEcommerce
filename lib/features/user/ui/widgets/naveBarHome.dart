
import 'package:e_commerce_project/features/user/ui/widgets/textFieldwidget.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NaveBarHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(width: 10,),
          
          Container(
            margin: EdgeInsets.only(top: 10),
            width: ScreenUtil().setHeight(300),
            height: ScreenUtil().setHeight(50),
            child: TextFieldWidget(
              nameIcon: Icon(Icons.search),
              hintName: 'Search Product',
            ),

          ),

            IconButton(
              icon: Icon(EvaIcons.heart , size: 25,),
               onPressed: (){}
              )  ,

            Row(
              children: <Widget>[
                IconButton(
                  
                  
                   onPressed: (){},
                   icon: Stack(
                     children: <Widget>[
                       Icon(Icons.notifications_none ,size: 25,),
                       Positioned(
                         child: Icon(
                           Icons.brightness_1 , 
                           color: Colors.red,
                           size: 10,
                           )
                         )
                     ],
                   )
                   )
              ],
            )
        ],
      
    );
  }
}