import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mote/pages/member/settings.dart';

class MemberPage extends StatelessWidget {
  const MemberPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Container(
          height: ScreenUtil().setHeight(638),
          child: Container(
            height: ScreenUtil().setHeight(460),
            decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFFF9E9F), Color(0xFFFF5658)], begin: FractionalOffset(0, 0), end: FractionalOffset(1, 1))),
            child:Column(children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(750),
                padding: EdgeInsets.fromLTRB(337, 27, 0, 0),
                child: IconButton(
                  icon: Image.asset('assets/images/settings.png'),              
                  onPressed: (){},
              )),
              Row(children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    width: ScreenUtil().setWidth(100),
                    height: ScreenUtil().setHeight(130),
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/2.png'), fit: BoxFit.fill),
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
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(6))),
                child: Row(children: <Widget>[
                  Text('通告管理', style: TextStyle(fontSize: ScreenUtil().setSp(26), fontWeight: FontWeight.w500))
              ]))
            ])
          )
        )
      ])
    );
  }
}
