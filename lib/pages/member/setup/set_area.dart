import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:async/src/async_memoizer.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../provide/login.dart';

final AsyncMemoizer _memoizer = AsyncMemoizer();
var areaList;

class SetArea extends StatefulWidget {
  SetArea({Key key}) : super(key: key);

  _SetAreaState createState() => _SetAreaState();
}

class _SetAreaState extends State<SetArea> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text('设置地区',
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: ScreenUtil().setSp(34),
            fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          RaisedButton(
            onPressed: (){
              print('area');
            },
            child: Text('保存', style: TextStyle(color: Color(0xFFFF5658), fontSize: ScreenUtil().setSp(32)),),
            color: Colors.transparent,
            elevation: 0,
          )
        ],
      ),
      body: Container(child: FutureBuilder(
        future: _getArea(context),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Provide<LoginProvide>(builder: (context, child, val){
              areaList = Provide.value<LoginProvide>(context).list;
              return Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),   
                  child: EasyRefresh(
                    header: BallPulseHeader(color: Color(0xFFFF5658)),
                    footer: BallPulseFooter(color: Color(0xFFFF5658)),
                    onRefresh: () async {
                      _getArea(context);
                    },
                    onLoad: () async {
                      _getAreaList(context);
                    },
                    child: Container(
                      color: Color(0xFFFFFFFF),
                      child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index){
                        return ListTile(title: Text("$areaList", style: TextStyle(fontSize: ScreenUtil().setSp(28))));
                      },
                      separatorBuilder: (context, index){
                        return Container(
                          color: Color(0xFFF5F5F5),
                          height: ScreenUtil().setHeight(2),
                        );
                      }
                    ),
                  )
              ));
            });
          }else{
            return Container();
          }
        },
      ))
    );
  }

  Future<String> get(key) async {
    var value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    value = prefs.getString(key);
    return value;
  }

  Future _getArea(BuildContext context) async {    
    return _memoizer.runOnce(() async {
      
      await Provide.value<LoginProvide>(context).getAreaList(); //获取地区列表
      return '完成加载';
    });
  }

  Future _getAreaList(BuildContext context) async {
    await Provide.value<LoginProvide>(context).getAreaList(); //获取地区列表
    return '完成加载';
  }

}
