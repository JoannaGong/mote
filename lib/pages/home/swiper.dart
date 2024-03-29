import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provide/provide.dart';
import '../../provide/home.dart';
import '../../main.route.dart';

//轮播
class SwiperDiy extends StatelessWidget {
  final List bannerList;
  const SwiperDiy({Key key, this.bannerList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Provide<HomeProvide>(
      builder: (context, child, val) {
        var banner =
            Provide.value<HomeProvide>(context).bannerData.data.bannerList;
        return Container(
          height: 150,
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
          padding: EdgeInsets.fromLTRB(
              ScreenUtil().setWidth(30), 0, ScreenUtil().setWidth(30), 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      ROUTE_WEB_VIEW_PAGE,
                      arguments: "${banner[index].pageUrl}",
                    );
                  },
                  child: Image.network(
                    '${banner[index].iconUrl}',
                    fit: BoxFit.fill,
                  ),
                );
              },
              itemCount: banner.length,
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
      },
    ));
  }
}
