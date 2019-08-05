import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

//轮播
class SwiperDiy extends StatelessWidget {
  const SwiperDiy({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(343),
      height: ScreenUtil().setHeight(140),
      margin: EdgeInsets.only(top: 10.0),
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          return Image.network('http://via.placeholder.com/288x188',fit: BoxFit.fill,);
        },
        itemCount: 3,
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            size: 10,
            activeSize: 10,
            color: Color(0xFFFFFFFF),
            activeColor: Color(0xFFFF5658)
          )
        ),
        autoplay: true,
        
      ),
    );
  }
}