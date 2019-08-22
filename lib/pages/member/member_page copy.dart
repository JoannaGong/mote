import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mote/pages/member/settings.dart';

class MemberPage extends StatelessWidget {
  const MemberPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Container(
          height: ScreenUtil().setHeight(838),
          child: Container(
            height: ScreenUtil().setHeight(460),
            decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFFF9E9F), Color(0xFFFF5658)], begin: FractionalOffset(0, 0), end: FractionalOffset(1, 1))),
            child:Column(children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(337, 27, 0, 0),
                child: IconButton(
                  icon: Image.asset('assets/images/settings.png'),              
                  onPressed: (){},
              )),
              Row(children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Container(
                    width: ScreenUtil().setWidth(120),
                    height: ScreenUtil().setWidth(120),
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/2.png'), fit: BoxFit.cover),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: ScreenUtil().setWidth(3))
                    ),
                  )
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Container(margin: EdgeInsets.only(bottom: 8), child: Text('金闪闪', style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(32)))),
                  Container(child: Text('模特     ID: 87789909', style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(24))))
                ])
              ]),
              Container(
                width: ScreenUtil().setWidth(686),
                margin: EdgeInsets.fromLTRB(16, 20, 16, 0),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top:Radius.circular(6)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('通告管理', style: TextStyle(fontSize: ScreenUtil().setSp(26), fontWeight: FontWeight.w500)),
                    Container(
                      height: ScreenUtil().setHeight(178),
                      child: GridView.count(
                        crossAxisCount: 5,
                        children: <Widget>[
                          Column(children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              width: ScreenUtil().setWidth(50),
                              height: ScreenUtil().setHeight(44),
                              child: Image.asset('assets/images/yuyuezhongxin.png')
                            ),
                            Text('定向预约', style: TextStyle(fontSize: ScreenUtil().setSp(24)))
                          ]),
                          Column(children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              width: ScreenUtil().setWidth(50),
                              height: ScreenUtil().setHeight(44),
                              child: Image.asset('assets/images/shenqing-3.png')
                            ),
                            Text('申请中', style: TextStyle(fontSize: ScreenUtil().setSp(24)))
                          ]),
                          Column(children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              width: ScreenUtil().setWidth(50),
                              height: ScreenUtil().setHeight(44),
                              child: Image.asset('assets/images/weiwancheng-tianchong.png')
                            ),
                            Text('待完成', style: TextStyle(fontSize: ScreenUtil().setSp(24)))
                          ]),
                          Column(children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              width: ScreenUtil().setWidth(50),
                              height: ScreenUtil().setHeight(44),
                              child: Image.asset('assets/images/biaodanwancheng2.png')
                            ),
                            Text('已完成', style: TextStyle(fontSize: ScreenUtil().setSp(24)))
                          ]),
                          Column(children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              width: ScreenUtil().setWidth(50),
                              height: ScreenUtil().setHeight(44),
                              child: Image.asset('assets/images/yichexiao.png')
                            ),
                            Text('撤销失败', style: TextStyle(fontSize: ScreenUtil().setSp(24)))
                          ]), 
                    ])) //   decoration: BoxDecoration(border: BorderDirectional(bottom: BorderSide(color: Colors.black, width: ScreenUtil().setWidth(1)))),
                ])
              )
            ])
          )
        )
      ])
    );
  }
}
