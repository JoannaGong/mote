import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mote/pages/member/settings.dart';

class MemberPage extends StatelessWidget {
  const MemberPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(color: Color(0xFFF5F5F5),),
        Positioned(
          top: 0,          
          child: Container(
            height: ScreenUtil().setHeight(460),
            width: ScreenUtil().setWidth(750),
            decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFFF9E9F), Color(0xFFFF5658)], begin: FractionalOffset(0, 0), end: FractionalOffset(1, 1))),
            child:Column(children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(674), 20, 0, 0),
                child: IconButton(
                  icon: Image.asset('assets/images/settings.png'),
                  onPressed: (){},
              )),
              Row(children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: ScreenUtil().setHeight(32)),
                  child: Container(
                    width: ScreenUtil().setWidth(104),
                    height: ScreenUtil().setWidth(104),
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
                  Container(margin: EdgeInsets.only(bottom: 8), child: Text('金闪闪', style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(36)))),
                  Container(child: Text('模特     ID: 87789909', style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(28))))
                ])
              ]),
            ])
          )
        ),
        Positioned(
          top: ScreenUtil().setHeight(330),          
          child:Container(
            width: ScreenUtil().setWidth(686),
            height: ScreenUtil().setHeight(290),
            margin: EdgeInsets.fromLTRB(16, 20, 16, 0),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('通告管理', style: TextStyle(fontSize: ScreenUtil().setSp(26), fontWeight: FontWeight.w500)),
                Container(
                  height: ScreenUtil().setHeight(1),
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(22)),
                  decoration: BoxDecoration(color: Color(0xFFE2E2E2)),
                ),
                Container(
                  height: ScreenUtil().setHeight(148),
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
                        Text('定向预约', style: TextStyle(fontSize: ScreenUtil().setSp(24)))
                      ]),
                      Column(children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
                          width: ScreenUtil().setWidth(44),
                          height: ScreenUtil().setHeight(44),
                          child: Image.asset('assets/images/shenqing-3.png')
                        ),
                        Text('申请中', style: TextStyle(fontSize: ScreenUtil().setSp(24)))
                      ]),
                      Column(children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
                          width: ScreenUtil().setWidth(44),
                          height: ScreenUtil().setHeight(44),
                          child: Image.asset('assets/images/weiwancheng-tianchong.png')
                        ),
                        Text('待完成', style: TextStyle(fontSize: ScreenUtil().setSp(24)))
                      ]),
                      Column(children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
                          width: ScreenUtil().setWidth(44),
                          height: ScreenUtil().setHeight(44),
                          child: Image.asset('assets/images/biaodanwancheng2.png')
                        ),
                        Text('已完成', style: TextStyle(fontSize: ScreenUtil().setSp(24)))
                      ]),
                      Column(children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
                          width: ScreenUtil().setWidth(44),
                          height: ScreenUtil().setHeight(44),
                          child: Image.asset('assets/images/yichexiao.png')
                        ),
                        Text('撤销失败', style: TextStyle(fontSize: ScreenUtil().setSp(24)))
                      ]), 
                ]))
                ])
              )
        ),
        // 我的钱包
        buildMoney(),
        // 我的作品
        buildWork()
      ])
    );
  }

  //  我的钱包
  Positioned buildMoney(){
    return Positioned(
      top: ScreenUtil().setHeight(675),            
      child: Container(        
        width: ScreenUtil().setWidth(686),
        height: ScreenUtil().setHeight(458),
        margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32), vertical: ScreenUtil().setHeight(40)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(0),
          children: <Widget>[
          ListTile(
            title: Text('我的钱包', style: TextStyle(fontSize: ScreenUtil().setSp(28))),
            leading: Image(
              image: AssetImage('assets/images/qianbao.png'),
              width: ScreenUtil().setWidth(50),
              height: ScreenUtil().setHeight(50),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            dense: true,
            isThreeLine: false,
          ),
          ListTile(
            title: Text('我的收藏', style: TextStyle(fontSize: ScreenUtil().setSp(28))),
            leading: Image(
              image: AssetImage('assets/images/shoucang-3.png'),
              width: ScreenUtil().setWidth(50),
              height: ScreenUtil().setHeight(50),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            isThreeLine: false,
            dense: true,
          ),
          ListTile(
            title: Text('我的主页', style: TextStyle(fontSize: ScreenUtil().setSp(28))),
            leading: Image(
              image: AssetImage('assets/images/zhuye-xuanzhong.png'),
              width: ScreenUtil().setWidth(50),
              height: ScreenUtil().setHeight(50),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            isThreeLine: false,
            dense: true,
          ),
          ListTile(
            title: Text('我的佣金管理（经纪）', style: TextStyle(fontSize: ScreenUtil().setSp(28))),
            leading: Image(
              image: AssetImage('assets/images/jine.png'),
              width: ScreenUtil().setWidth(50),
              height: ScreenUtil().setHeight(50),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            isThreeLine: false,
            dense: true,
          )
        ])),
    );
  }
  // 我的作品
  Positioned buildWork(){
    return Positioned(
      top: ScreenUtil().setHeight(1175),            
      child: Container(        
        width: ScreenUtil().setWidth(686),
        height: ScreenUtil().setHeight(228),
        margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32), vertical: ScreenUtil().setHeight(40)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(0),
          children: <Widget>[
          ListTile(
            title: Text('我的作品', style: TextStyle(fontSize: ScreenUtil().setSp(28))),
            leading: Image(
              image: AssetImage('assets/images/wendang.png'),
              width: ScreenUtil().setWidth(50),
              height: ScreenUtil().setHeight(50),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            dense: true,
            isThreeLine: false,
          ),
          ListTile(
            title: Text('我的经纪公司（模特）', style: TextStyle(fontSize: ScreenUtil().setSp(28))),
            leading: Image(
              image: AssetImage('assets/images/gongsiguanli.png'),
              width: ScreenUtil().setWidth(50),
              height: ScreenUtil().setHeight(50),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            isThreeLine: false,
            dense: true,
          )
        ])),
    );
  }
}
