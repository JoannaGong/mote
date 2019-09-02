import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mote/pages/common/loading.dart';
import 'package:mote/pages/member/setup/set_name.dart';
import 'package:provide/provide.dart';
import 'package:async/src/async_memoizer.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';

import '../../../provide/login.dart';
import '../../../provide/main.dart';

final AsyncMemoizer _memoizer = AsyncMemoizer();
var userInfo;
var photoData;

class Model extends StatefulWidget {
  Model({Key key}) : super(key: key);

  _ModelState createState() => _ModelState();
}

class _ModelState extends State<Model> {
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(title: Text('艺人认证', style: TextStyle(color: Color(0xFF333333),fontSize: ScreenUtil().setSp(34), fontWeight: FontWeight.bold)), centerTitle: true, backgroundColor: Color(0xFFFFFFFF), elevation: 0, iconTheme: IconThemeData(color: Colors.black)),
      body: Container(child: FutureBuilder(
        future: _getArea(context),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Provide<LoginProvide>(builder: (context, child, val){
              userInfo = Provide.value<LoginProvide>(context).userInfo;
              // photoData = Provide.value<LoginProvide>(context).photos;
              return Container(  
                child: EasyRefresh(
                  header: BallPulseHeader(color: Color(0xFFFF5658)),
                  footer: BallPulseFooter(color: Color(0xFFFF5658)),
                  onRefresh: () async {
                    _getArea(context);
                  },
                  onLoad: () async {
                    _getAreaList(context);
                  },
                  child: ListView(children: <Widget>[
                    _modelAvatar(),     // 头像
                    _photoList(photoData),     // 相册
                    // _modelInfo(modelData),   // 模特信息
                  ])
              ));
            });
          }else{
            return Container(child: LoadingPage(),);
          }
        },
      ))
    );
  }

  Future _getArea(BuildContext context) async {    
    return _memoizer.runOnce(() async {
      // await Provide.value<LoginProvide>(context).getAreaList(); // 获取地区列表
      return '完成加载';
    });
  }

  Future _getAreaList(BuildContext context) async {
    // await Provide.value<LoginProvide>(context).getAreaList(); // 获取地区列表
    return '完成加载';
  }

  Widget _modelInfo(data){
    return Column(children: <Widget>[
      Row(children: <Widget>[
        Text('模特信息',style: TextStyle(fontSize: ScreenUtil().setSp(34), fontWeight: FontWeight.w500)),
        Expanded(
          child: Align(
            child: GestureDetector(
              onTap: () {},
              child: Text('编辑', style: TextStyle(fontSize: ScreenUtil().setSp(28), color: Color(0xFF999999))),
            ),
            alignment: Alignment.centerRight,
        )),
        Icon(
          Icons.keyboard_arrow_right,
          color: Colors.grey,
          size: ScreenUtil().setSp(44),
      )]),
      Column(children: <Widget>[
        Row(children: <Widget>[
          Text('身高：', style: TextStyle(fontSize: ScreenUtil().setSp(28), color: Color(0xFF999999))),
          Container(
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(32)),
            child:Text('170cm', style: TextStyle(fontSize: ScreenUtil().setSp(28), color: Color(0xFF333333)))
          ),
          Expanded(
            child: Align(
              child: GestureDetector(
                onTap: () {},
                child: Text('体重：', style: TextStyle(fontSize: ScreenUtil().setSp(28), color: Color(0xFF999999))),
              ),
              alignment: Alignment.centerRight,
          )),
          Container(
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(32)),
            child:Text('40kg', style: TextStyle(fontSize: ScreenUtil().setSp(28), color: Color(0xFF333333)))
          ),
        ])
      ])
    ]);
  }

  Column _photoList(data) {
    return Column(children: <Widget>[
      Row(children: <Widget>[
        Text('相册',style: TextStyle(fontSize: ScreenUtil().setSp(34), fontWeight: FontWeight.w500)),
        Expanded(
          child: Align(
            child: GestureDetector(
              onTap: () {},
              child: Text('编辑', style: TextStyle(fontSize: ScreenUtil().setSp(28), color: Color(0xFF999999))),
            ),
            alignment: Alignment.centerRight,
        )),
        Icon(
          Icons.keyboard_arrow_right,
          color: Colors.grey,
          size: ScreenUtil().setSp(44),
        ),
      ]),
      Container(
        height: 150,
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(15), top: ScreenUtil().setHeight(20)),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return _model(data[index]);
        }),
      )
    ]);
  }

  Widget _model(item) {
    return Container(
      margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          width: ScreenUtil().setWidth(219),
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Color(0xFFF5F5F5),
                offset: Offset(1, 1),
                blurRadius: 5),
          ]),
          child: Column(
            children: <Widget>[
              Image.network(
                item.coverUrl,
                width: ScreenUtil().setWidth(240),
                height: ScreenUtil().setWidth(320),
                fit: BoxFit.contain,
              ),
          ])
    )));
  }

  Container _modelAvatar(){
    return Container(
      color: Color(0xFFFFFFFF),
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(30)),
      child: Row(children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB( 16, ScreenUtil().setHeight(20), 16, ScreenUtil().setHeight(32)),
          child: Container(
            width: ScreenUtil().setWidth(104),
            height: ScreenUtil().setWidth(104),
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage('${userInfo.headUrl}'), fit: BoxFit.cover),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: ScreenUtil().setWidth(3))
            ),
          )
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Container(margin: EdgeInsets.only(bottom: 8), child: Text('${userInfo.name}', style: TextStyle(color: Color(0xFF333333), fontSize: ScreenUtil().setSp(36)))),
          Container(child: Text('ID：${userInfo.id}', style: TextStyle(color: Color(0xFF999999), fontSize: ScreenUtil().setSp(28))))
        ])
      ]),
    );
  }

}
