import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluro/fluro.dart';

import '../../routers/application.dart';
import '../../provide/shoot_site.dart';

final lableColor = {
  '0': Color(0xFFFF7417),
  '1': Color(0xFFFF5658),
  '2': Color(0xFF3DCAFF),
  '3': Color(0xFFFF5658),
  '4': Color(0xFFFFAF3B)
};

class ShootSiteDetailPage extends StatelessWidget {
  final String id;
  const ShootSiteDetailPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        body: FutureBuilder(
          future: _getShootSiteDetail(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Provide<ShootSiteProvide>(
                builder: (context, child, val) {
                  var shootSiteDetaildata =
                      Provide.value<ShootSiteProvide>(context)
                          .shootSiteDetaildata
                          .data
                          .shootingPlace;
                  return NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[_appbar(context, shootSiteDetaildata)];
                    },
                    body: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          color: Colors.white,
                          alignment: Alignment.topLeft,
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                DetailTitle(
                                  detail: shootSiteDetaildata,
                                ),
                                Line(),
                                DetailContent(contentData: shootSiteDetaildata)
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 30,
                          child: GestureDetector(
                            onTap: () {
                              Application.router.navigateTo(
                                  context, '/activityForm?id=$id',
                                  transition: TransitionType.inFromRight);
                            },
                            child: Container(
                              width: ScreenUtil().setWidth(686),
                              height: ScreenUtil().setHeight(88),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(40),
                                gradient: const LinearGradient(colors: [
                                  Color(0xFFFF9E9F),
                                  Color(0xFFFF5658),
                                ]),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xFFFF5153),
                                      offset: Offset(1, 1),
                                      blurRadius: 2,
                                      spreadRadius: 0.1),
                                ],
                              ),
                              child: Text(
                                '转发',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil().setSp(34)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            } else {
              return Container();
            }
          },
        ));
  }

  Future _getShootSiteDetail(BuildContext context) async {
    await Provide.value<ShootSiteProvide>(context)
        .getShootSiteDetail(id); //获取活动列表
    return '完成加载';
  }

  Widget _appbar(BuildContext context, data) {
    return SliverAppBar(
      title: Text(
        '拍摄圣地详情',
        style: TextStyle(
            color: Color(0xFF333333), fontSize: ScreenUtil().setSp(34)),
      ),
      leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Color(0xFF333333),
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      brightness: Brightness.light,
      backgroundColor: Color(0xFFF5F5F5),
      elevation: 0,
      primary: true, //是否预留高度
      forceElevated: false,
      automaticallyImplyLeading: true,
      titleSpacing: NavigationToolbar.kMiddleSpacing,
      snap: true, //与floating结合使用
      expandedHeight: ScreenUtil().setHeight(536), //展开高度
      floating: true, //是否随着滑动隐藏标题
      pinned: true, //是否固定在顶部
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          background: Image.network(
            data.coverPicUrl,
            fit: BoxFit.fill,
          )),
    );
  }
}

class DetailTitle extends StatelessWidget {
  final detail;
  const DetailTitle({Key key, this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[_title(detail), _address(detail), _lable(detail)],
      ),
    );
  }

  Widget _title(data) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text(
            data.name,
            style: TextStyle(
                color: Color(0xFF333333),
                fontSize: ScreenUtil().setSp(40),
                fontWeight: FontWeight.w500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              '${data.score.toString()}分',
              style: TextStyle(
                  color: Color(0xFFFF1919),
                  fontSize: ScreenUtil().setSp(28),
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }

  Widget _address(data) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Image.asset('assets/images/didian.png',
              width: ScreenUtil().setWidth(28),
              height: ScreenUtil().setHeight(32)),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              data.address,
              style: TextStyle(
                  color: Color(0xFF999999), fontSize: ScreenUtil().setSp(28)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

  Widget _lable(data) {
    return Container(
        child: Row(
      children: <Widget>[
        Image.asset('assets/images/didian.png',
            width: ScreenUtil().setWidth(28),
            height: ScreenUtil().setHeight(32)),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: (data.shootingPlaceLableList as List)
                  .asMap()
                  .keys
                  .map((index) {
                return _lableText(data.shootingPlaceLableList[index], index);
              }).toList(),
            ),
          ),
        )
      ],
    ));
  }

  Widget _lableText(data, index) {
    index = index % lableColor.length;
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Text(data.lable.name,style: TextStyle(color: lableColor[index.toString()]),),
    );
  }
}

//横线
class Line extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(20),
      decoration: BoxDecoration(color: Color(0xFFF5F5F5)),
    );
  }
}

class DetailContent extends StatelessWidget {
  final contentData;
  const DetailContent({Key key, this.contentData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[_title(), _html()],
      ),
    );
  }

  Widget _title() {
    return Container(
      child: Row(
        children: <Widget>[
          Text('图文详情',
              style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: ScreenUtil().setSp(30),
                  fontWeight: FontWeight.w500))
        ],
      ),
    );
  }

  Widget _html() {
    return Container(
      child: Html(
        data: contentData.introduce,
      ),
    );
  }
}
