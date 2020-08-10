import 'package:e_commerce_project/features/user/ui/widgets/recommend_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommProduct extends StatelessWidget {
  List<Widget> mySlider = [
    RecommendSlider(
      imgUrl: 'assets/images/product3.png',
      title: 'Recomended Product',
      subTitle: 'We recommend the best for you',
      ),
      RecommendSlider(
      imgUrl: 'assets/images/product3.png',
      title: 'Recomended Product',
      subTitle: 'We recommend the best for you',
      ),
      RecommendSlider(
      imgUrl: 'assets/images/product3.png',
      title: 'Recomended Product',
      subTitle: 'We recommend the best for you',
      ),
    
     ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(370),
      height: ScreenUtil().setHeight(250),

      child: PageView.builder(
        
        
        itemCount: mySlider.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context , index){
          return mySlider[index];
        }
        ) 
    );
  }
}