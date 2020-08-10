import 'package:e_commerce_project/features/user/Provider/e_c_provider.dart';
import 'package:e_commerce_project/features/user/ui/widgets/card_store.dart';
import 'package:e_commerce_project/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllStore extends StatelessWidget {
  List<String> listNameStore = [
  'Super\nMarket',
  'Clothes',
  'shoes',
  'electronics',
  'computer',
  'mobile'
];



  @override
  Widget build(BuildContext context) {

     ECProvider ecProvider = Provider.of<ECProvider>(context);
     
     ecProvider.getAllStore();
     
     
    return Scaffold(
      appBar: AppBar(
        title: Text('All Store'),
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
          Container(
            height: ScreenUtil().setHeight(70),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listNameStore.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
            height: ScreenUtil().setHeight(50),
            width: ScreenUtil().setWidth(100),
            decoration: BoxDecoration(
              color: style.Colors.titleColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                bottomRight: Radius.circular(35)
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  blurRadius: 5,
                  color: Colors.grey.withOpacity(.2),
                  
                )


              ]
            ),
            child: Center(child: Text(listNameStore[index]),),
          );
              },)
          ),
          SizedBox(height: 15,),
          Consumer<ECProvider>(
            builder: (context, value, child) {
              value.getAllStore();
              List<UserModel> myStore = value.allStore;
              print("rlllllllllll ${myStore.length}");
              return myStore != null
              ?
              Container(
              height: ScreenUtil().setHeight(585),
              child: ListView.builder(
                itemCount: myStore.length,
                itemBuilder: (context, index) {
                  
              return CardStore(myStore[index].imgProfile , myStore[index].name ,myStore[index] );
                  
                  
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


