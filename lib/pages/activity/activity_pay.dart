import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:route_annotation/route_annotation.dart';

import '../../provide/activity.dart';

@RoutePage(params: [RouteParameter("id")])

class ActivityPayPage extends StatelessWidget {
  final String id;
  const ActivityPayPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
        title: Text('确认支付',
            style: TextStyle(
                color: Color(0xFF333333), fontSize: ScreenUtil().setSp(34))),
        leading: GestureDetector(
          child: Icon(
            Icons.keyboard_arrow_left,
            color: Color(0xFF333333),
            size: 30,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
        future: _getActivityDetail(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Provide<ActivityProvide>(
              builder: (context, child, val) {
                var activityDetaildata = Provide.value<ActivityProvide>(context)
                    .activityDetaildata
                    .data
                    .activity;
                return Stack(
                  children: <Widget>[
                    ListView(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            children: <Widget>[
                              _list('活动名称', activityDetaildata.name,
                                  border: true),
                              _list('活动时间',
                                  '${activityDetaildata.activityStartTime.substring(0, 10)} - ${activityDetaildata.activityStopTime.substring(0, 10)}',
                                  border: false)
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: _list('报名活动费',
                              '￥${activityDetaildata.applicationPrice.toString()}',
                              color: Color(0xFFFF1919), border: false),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: _list('支付方式', '', border: false),
                        ),
                        RedioList()
                      ],
                    ),
                    Positioned(
                      bottom: 10,
                      child: Container(
                          color: Colors.white,
                          width: ScreenUtil().setWidth(750),
                          height: ScreenUtil().setHeight(182),
                          padding: EdgeInsets.fromLTRB(0, 5, 15, 0),
                          alignment: Alignment.topRight,
                          child: _foot(activityDetaildata)),
                    )
                  ],
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Future _getActivityDetail(BuildContext context) async {
    await Provide.value<ActivityProvide>(context)
        .getActivityDetail(id); //获取活动列表
    return '完成加载';
  }

  Widget _foot(activityDetaildata) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            '总额：',
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: ScreenUtil().setSp(28)),
          )),
          Text(
            '￥${activityDetaildata.applicationPrice.toString()}',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(30), color: Color(0xFFFF5658)),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: ScreenUtil().setWidth(200),
              height: ScreenUtil().setHeight(70),
              margin: EdgeInsets.only(left: 10),
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
                '支付',
                style: TextStyle(
                    color: Colors.white, fontSize: ScreenUtil().setSp(30)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _list(String title, String content, {Color color, bool border}) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: border ? 0.5 : 0.1, color: Color(0xFFE2E2E2)))),
        child: Row(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: ScreenUtil().setSp(30)),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 15),
                child: Text(
                  content,
                  style:
                      TextStyle(fontSize: ScreenUtil().setSp(30), color: color),
                  textAlign: TextAlign.right,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RedioList extends StatefulWidget {
  RedioList({Key key}) : super(key: key);

  _RedioListState createState() => _RedioListState();
}

class _RedioListState extends State<RedioList> {
  int groupValue = 1;

  void onChange(val) {
    this.setState(() {
      groupValue = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _item('assets/images/pic.png', '钱包余额', true, 1),
        _item('assets/images/zhifubao.png', '支付宝', true, 2),
        _item('assets/images/wechat.png', '微信', false, 3)
      ],
    );
  }

  Widget _item(String img, String title, bool border, int val) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: border ? 0.5 : 0.1, color: Color(0xFFE2E2E2)))),
        child: Row(
          children: <Widget>[
            Image.asset(img,
                fit: BoxFit.fill,
                width: ScreenUtil().setWidth(40),
                height: ScreenUtil().setHeight(40)),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 15, left: 10),
                child: Text(
                  title,
                  style: TextStyle(fontSize: ScreenUtil().setSp(30)),
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Radio(
              value: val,
              groupValue: groupValue,
              activeColor: Color(0xFFFF5658),
              onChanged: (T) {
                onChange(T);
              },
            )
          ],
        ),
      ),
    );
  }
}
