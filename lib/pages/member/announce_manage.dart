import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnnounceManage extends StatelessWidget {
  const AnnounceManage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: ScreenUtil().setHeight(330), 
      child:Container(
        width: ScreenUtil().setWidth(686),
        height: ScreenUtil().setHeight(450),
        margin: EdgeInsets.fromLTRB(16, 20, 16, 0),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[                
            Row(                  
              children: <Widget>[
              Text('通告管理', style: TextStyle(fontSize: ScreenUtil().setSp(26), fontWeight: FontWeight.w500)),
            ]),
            Container(
              height: ScreenUtil().setHeight(1),
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(22)),
              decoration: BoxDecoration(color: Color(0xFFE2E2E2)),
            ),
            Container(
              height: ScreenUtil().setHeight(308),
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 5,
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
                children: <Widget>[
                  Column(children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
                      width: ScreenUtil().setWidth(44),
                      height: ScreenUtil().setHeight(44),
                      child: Image.asset('assets/images/yuyuezhongxin.png')
                    ),
                    Text('审核中', style: TextStyle(fontSize: ScreenUtil().setSp(24)))
                  ]),
                  Column(children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
                      width: ScreenUtil().setWidth(44),
                      height: ScreenUtil().setHeight(44),
                      child: Image.asset('assets/images/yuyuezhongxin.png')
                    ),
                    Text('定向预约', style: TextStyle(fontSize: ScreenUtil().setSp(24)))
                  ]),
                  Column(children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
                      width: ScreenUtil().setWidth(44),
                      height: ScreenUtil().setHeight(44),
                      child: Image.asset('assets/images/shenqing-3.png')
                    ),
                    Text('招募中', style: TextStyle(fontSize: ScreenUtil().setSp(24)))
                  ]),
                  Column(children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
                      width: ScreenUtil().setWidth(44),
                      height: ScreenUtil().setHeight(44),
                      child: Image.asset('assets/images/weiwancheng-tianchong.png')
                    ),
                    Text('评价', style: TextStyle(fontSize: ScreenUtil().setSp(24)))
                  ]),
                  Column(children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
                      width: ScreenUtil().setWidth(44),
                      height: ScreenUtil().setHeight(44),
                      child: Image.asset('assets/images/biaodanwancheng2.png')
                    ),
                    Text('撤销/失效', style: TextStyle(fontSize: ScreenUtil().setSp(24)))
                  ]),
                  Column(children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
                      width: ScreenUtil().setWidth(44),
                      height: ScreenUtil().setHeight(44),
                      child: Image.asset('assets/images/yichexiao.png')
                    ),
                    Text('审核中', style: TextStyle(fontSize: ScreenUtil().setSp(24)))
                  ]),
                  Column(children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
                      width: ScreenUtil().setWidth(44),
                      height: ScreenUtil().setHeight(44),
                      child: Image.asset('assets/images/yichexiao.png')
                    ),
                    Text('我的售后', style: TextStyle(fontSize: ScreenUtil().setSp(24)))
                  ]), 
            ]))
            ])
          )
    );
  }
}