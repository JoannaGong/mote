import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'dart:async';
import 'package:async/src/async_memoizer.dart';

import '../../routers/application.dart';
import '../../provide/home.dart';

import '../common/search/serch_text.dart';
import './swiper.dart';
import './top_navigator.dart';
import './recommend_shoot.dart';
import './recommend_production.dart';
import './recommend_model.dart';
import './recommend_official.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final AsyncMemoizer _memoizer = AsyncMemoizer();
  List list = [
    'assets/images/ic_home_fmodel.png',
    'assets/images/ic_home_other.png',
    'assets/images/ic_home_activity.png',
    'assets/images/ic_home_photo.png'
  ];
  List ponList = [1, 2, 3, 4, 5, 6];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          brightness: Brightness.light,
          title: Search(
            text: '您要找什么',
            router: '/searchDetail',
          ),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          child: FutureBuilder(
            future: _getHomeInfo(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child: EasyRefresh(
                    header: BallPulseHeader(color: Color(0xFFFF5658)),
                    onRefresh: () async {
                      _refresh(context);
                    },
                    child: ListView(
                      children: <Widget>[
                        SwiperDiy(), //轮播图
                        TopNavigator(), //导航栏
                        Container(
                          width: ScreenUtil().setWidth(686),
                          height: ScreenUtil().setHeight(1),
                          color: Color(0xFFE2E2E2),
                        ),
                        RecommendShoot(), //推荐摄影
                        RecommendModel(), //推荐模特
                        Line(), //横线
                        RecommendProduction(
                          productionList: ponList,
                        ), //作品推荐
                        RecommendOfficial(
                          productionList: ponList,
                        ) //官方推荐
                      ],
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ));
  }

  Future _getHomeInfo(BuildContext context) async {
    return _memoizer.runOnce(() async {
      await Provide.value<HomeProvide>(context).getBannerList(); //获取banner
      await Provide.value<HomeProvide>(context).getNavigatorList(2); //获取顶部导航
      await Provide.value<HomeProvide>(context).getShootlList(0); //获取摄影师、化妆师
      await Provide.value<HomeProvide>(context).getModelList(2); //获取模特、经纪人
      return '完成加载';
    });
  }

  void _refresh(BuildContext context) async {
    var isShoot = Provide.value<HomeProvide>(context).isShoot ? 0 : 1;
    var isModel = Provide.value<HomeProvide>(context).isModel ? 2 : 3;

    await Provide.value<HomeProvide>(context).getBannerList(); //获取banner
    await Provide.value<HomeProvide>(context).getNavigatorList(2); //获取顶部导航
    await Provide.value<HomeProvide>(context).getShootlList(isShoot); //获取摄影师、化妆师
    await Provide.value<HomeProvide>(context).getModelList(isModel); //获取模特、经纪人
  }
}

//横线
class Line extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(20),
      margin: EdgeInsets.fromLTRB(
          0, ScreenUtil().setHeight(30), 0, ScreenUtil().setHeight(30)),
      decoration: BoxDecoration(color: Color(0xFFF5F5F5)),
    );
  }
}
