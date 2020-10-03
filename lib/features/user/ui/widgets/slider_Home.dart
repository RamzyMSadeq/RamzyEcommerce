import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_project/features/user/ui/Screens/super_splash_sale.dart';
import 'package:e_commerce_project/features/user/ui/widgets/ContainerSlider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;


class SliderHome extends StatefulWidget {
  @override
  _SliderHomeState createState() => _SliderHomeState();
}

class _SliderHomeState extends State<SliderHome> {
  CarouselController carouselController= CarouselController();
  
  static int current=0;

  List<Widget> mySlider = [
    Hero(tag: 'e',
      child: ContainerSlider(imgUrl: 'assets/images/slider.png' ,)),
      Hero(tag: 'd',
      child: ContainerSlider(imgUrl: 'assets/images/slider.png' ,)),
      Hero(tag: 'v',
      child: ContainerSlider(imgUrl: 'assets/images/slider.png' ,)),
      
     
     ];
  
     
    
      List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: ScreenUtil().setHeight(210),
      //color: Colors.red,
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
               
                height: 180,
                
                child: CarouselSlider(
   items: [
     Hero(tag: 'ramzy',
      child: GestureDetector(
        onTap: (){Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=>SuperSplashSale(myHero: 'ramzy', nameurl: 'assets/images/slider.png',))
       
          );},
        child: Container(
          
          child: ContainerSlider(imgUrl: 'assets/images/sl5.jpg' ,)))),


      Hero(tag: 'a',
      child: GestureDetector(
        onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SuperSplashSale(myHero: 'a', nameurl: 'assets/images/product3.png',))
          );},
        child: ContainerSlider(imgUrl: 'assets/images/product3.png' ,))),


      Hero(tag: 'b',
      child: GestureDetector(
        onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SuperSplashSale(myHero: 'b', nameurl: 'assets/images/slider.png',))
          );},
        child: ContainerSlider(imgUrl: 'assets/images/slider.png' ,))),

   ],
   options: CarouselOptions(
          height: 300,
          aspectRatio: 16/9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: false,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          

          onPageChanged: (index, reason) {
            setState(() {
                current=index;
            });
          },
          scrollDirection: Axis.horizontal,
   )
 ),
              ),

 Row(
   
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(mySlider, (index, url) {
                return Container(
                  width: 10.0,
                  height: 30.0,
                  margin: EdgeInsets.symmetric( horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: current == index ? style.Colors.mainColor  : Colors.grey,
                  ),
                );
              }),
            ),

            ],
      ),
    );
      
    
  }
}