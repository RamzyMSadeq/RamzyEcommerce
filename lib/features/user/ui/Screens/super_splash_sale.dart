import 'package:e_commerce_project/features/user/ui/widgets/ContainerSlider.dart';
import 'package:e_commerce_project/features/user/ui/widgets/more_products.dart';
import 'package:e_commerce_project/features/user/ui/widgets/offers_products.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme.dart' as style;

class SuperSplashSale extends StatelessWidget {
  final String myHero;
  final String nameurl;
  SuperSplashSale({this.myHero , this.nameurl});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:style.Colors.secondColor ,
      appBar: AppBar(
        title: Text('Super Flash Sale'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){})
        ],
      ),

      body: ListView(
        children: <Widget>[
          SizedBox(height: 10,),
          Hero(tag: myHero,
            child: ContainerSlider(imgUrl: nameurl,)),

            Divider(),
            //SizedBox(height: 10,),

            OffersProducts(),

            


        ],
      ),
      
    );
  }
}