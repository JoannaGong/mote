import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

//轮播
class SwiperDiy extends StatelessWidget {
  const SwiperDiy({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
      padding: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(30), 0, ScreenUtil().setWidth(30), 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.asset('assets/images/banner.jpg',fit: BoxFit.fill,);
          },
          itemCount: 3,
          pagination: SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                  size: 8,
                  activeSize: 8,
                  color: Color(0xFFF5F5F5),
                  activeColor: Color(0xFFFF5658))),
          autoplay: true,
        ),
      ),
    );
  }
}
