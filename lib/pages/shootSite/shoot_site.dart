import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:async/src/async_memoizer.dart';
import '../../routers/application.dart';

class ShootSitePage extends StatefulWidget {
  ShootSitePage({Key key}) : super(key: key);

  _ShootSitePageState createState() => _ShootSitePageState();
}

class _ShootSitePageState extends State<ShootSitePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          brightness: Brightness.light,
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
          title: Text('拍摄圣地',
              style: TextStyle(
                  color: Color(0xFF333333), fontSize: ScreenUtil().setSp(34))),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          child: Column(
            children: <Widget>[FiltratePanel()],
          ),
        ));
  }
}

class FiltratePanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                '地区',
                style: TextStyle(fontSize: ScreenUtil().setSp(32)),
              ),
              Icon(Icons.keyboard_arrow_down, size: ScreenUtil().setSp(32)),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                '类型',
                style: TextStyle(fontSize: ScreenUtil().setSp(32)),
              ),
              Icon(Icons.keyboard_arrow_down, size: ScreenUtil().setSp(32)),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                '筛选',
                style: TextStyle(fontSize: ScreenUtil().setSp(32)),
              ),
              Padding(
                padding: EdgeInsets.only(left: ScreenUtil().setHeight(6)),
                child: Image(
                    width: ScreenUtil().setWidth(24),
                    height: ScreenUtil().setHeight(24),
                    image: AssetImage('assets/images/filtrate.png')),
              )
            ],
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
      color: Colors.white,
      padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(32), bottom: ScreenUtil().setHeight(32)),
    );
  }
}
