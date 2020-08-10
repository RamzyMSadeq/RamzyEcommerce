import 'package:e_commerce_project/features/user/ui/widgets/category_widget.dart';
import 'package:e_commerce_project/features/user/ui/widgets/flash_sale.dart';
import 'package:e_commerce_project/features/user/ui/widgets/mega_sale.dart';
import 'package:e_commerce_project/features/user/ui/widgets/more_products.dart';
import 'package:e_commerce_project/features/user/ui/widgets/naveBarHome.dart';
import 'package:e_commerce_project/features/user/ui/widgets/recommended_product.dart';
import 'package:e_commerce_project/features/user/ui/widgets/slider_Home.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme.dart' as style;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: style.Colors.secondColor,
      body: ListView(
          
          scrollDirection: Axis.vertical,
          children: <Widget>[
          
          SizedBox(height: 10,),
          NaveBarHome(),
          SizedBox(height: 10,),
          Divider(),
          SizedBox(height: 10,),
          SliderHome(),
          SizedBox(height: 10,),
          CategoryWidget(),
          SizedBox(height: 10,),
          FlashSale('Flash Sale'),
          SizedBox(height: 30,),
          MegaSale(),
          SizedBox(height: 30,),
          RecommProduct(),
          SizedBox(height: 10,),
          Divider(),
          MoreProducts(),
          
          ],
        ),


    );
  }
}