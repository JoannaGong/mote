import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluro/fluro.dart';

import '../../routers/application.dart';
import '../../provide/activity.dart';

class ShootSiteDetailPage extends StatelessWidget {
  final String id;
  const ShootSiteDetailPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        body: FutureBuilder(
          future: _getActivityDetail(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Provide<ActivityProvide>(
                builder: (context, child, val) {
                  var activityDetaildata =
                      Provide.value<ActivityProvide>(context)
                          .activityDetaildata
                          .data
                          .activity;
                  return NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[_appbar(context, activityDetaildata)];
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
                                  detail: activityDetaildata,
                                ),
                                Line(),
                                DetailContent(contentData: activityDetaildata)
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          child: GestureDetector(
                            onTap: (){
                              Application.router.navigateTo(context, '/activityForm?id=$id',transition: TransitionType.inFromRight);
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
                                '参加报名',
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

  Future _getActivityDetail(BuildContext context) async {
    await Provide.value<ActivityProvide>(context)
        .getActivityDetail(id); //获取活动列表
    return '完成加载';
  }

  Widget _appbar(BuildContext context, data) {
    return SliverAppBar(
      title: Text(
        '活动详情',
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
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.share,
              color: Color(0xFF333333),
            ),
            onPressed: () {}),
      ],
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
        children: <Widget>[
          _title(detail.name),
          _price(detail.applicationPrice),
          _list(detail)
        ],
      ),
    );
  }

  Widget _title(name) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text(
            name,
            style: TextStyle(
                color: Color(0xFF333333),
                fontSize: ScreenUtil().setSp(40),
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }

  Widget _price(price) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text(
            '￥${price.toString()}',
            style: TextStyle(
                color: Color(0xFFFF1919),
                fontSize: ScreenUtil().setSp(40),
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }

  Widget _list(data) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.local_atm,
                  color: Color(0xFF777777),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                        '${data.activityStartTime.substring(0, 10)} - ${data.activityStopTime.substring(0, 10)}',
                        style: TextStyle(
                            color: Color(0xFF777777),
                            fontSize: ScreenUtil().setSp(28),
                            fontWeight: FontWeight.w100),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              children: <Widget>[
                Icon(Icons.local_atm, color: Color(0xFF777777)),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('${data.address}',
                        style: TextStyle(
                            color: Color(0xFF777777),
                            fontSize: ScreenUtil().setSp(28),
                            fontWeight: FontWeight.w100),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Icon(Icons.local_atm, color: Color(0xFF777777)),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('${data.organizersName}',
                        style: TextStyle(
                            color: Color(0xFF777777),
                            fontSize: ScreenUtil().setSp(28),
                            fontWeight: FontWeight.w100),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
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
          Text('活动详情',
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
