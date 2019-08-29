import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:async/src/async_memoizer.dart';
import 'dart:math';
import '../../routers/application.dart';

import '../../provide/shoot_site.dart';

final AsyncMemoizer _memoizer = AsyncMemoizer();

final lableColor = {
  '0': Color(0xFFFF7417),
  '1': Color(0xFFFF5658),
  '2': Color(0xFF3DCAFF),
  '3': Color(0xFFFF5658),
  '4': Color(0xFFFFAF3B)
};

class ShootSitePage extends StatefulWidget {
  ShootSitePage({Key key}) : super(key: key);

  _ShootSitePageState createState() => _ShootSitePageState();
}

class _ShootSitePageState extends State<ShootSitePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
            children: <Widget>[FiltratePanel(), ShootList()],
          ),
        ));
  }
}

class FiltratePanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 0.5, color: Color(0xFFE2E2E2)))),
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
      padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(32), bottom: ScreenUtil().setHeight(32)),
    );
  }
}

class ShootList extends StatelessWidget {
  const ShootList({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _getShootSite(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Provide<ShootSiteProvide>(
              builder: (context, child, val) {
                var shootSiteList =
                    Provide.value<ShootSiteProvide>(context).list;
                return Expanded(
                    child: Container(
                  padding: EdgeInsets.all(15),
                  child: EasyRefresh(
                    header: BallPulseHeader(color: Color(0xFFFF5658)),
                    footer: BallPulseFooter(color: Color(0xFFFF5658)),
                    onRefresh: () async {
                      _getShootSiteList(context, false);
                    },
                    onLoad: () async {
                      _getShootSiteList(context, true);
                    },
                    child: ListView.builder(
                      itemCount: shootSiteList.length,
                      itemBuilder: (context, index) {
                        return _item(context, shootSiteList[index]);
                      },
                    ),
                  ),
                ));
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Future _getShootSite(BuildContext context) async {
    return _memoizer.runOnce(() async {
      await Provide.value<ShootSiteProvide>(context)
          .getShootSiteList(false); //获取拍摄地
      return '完成加载';
    });
  }

  Future _getShootSiteList(BuildContext context, bool type) async {
    await Provide.value<ShootSiteProvide>(context)
        .getShootSiteList(type); //获取拍摄地
    return '完成加载';
  }

  Widget _item(BuildContext context, data) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(
            color: Colors.grey[200],
            offset: Offset(1, 1),
            blurRadius: 3,
            spreadRadius: 0.1),
        BoxShadow(
            color: Colors.grey[200],
            offset: Offset(-1, 1),
            blurRadius: 3,
            spreadRadius: 0.1),
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: () {
             Application.router.navigateTo(context, 'activityDetail?id=${data.id}',
            transition: TransitionType.inFromRight);
          },
          child: Container(
            child: Column(
              children: <Widget>[_img(data.coverPicUrl), _content(data)],
            ),
          ),
        ),
      ),
    );
  }

  Widget _img(coverPicUrl) {
    return Container(
      height: ScreenUtil().setHeight(320),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Image.network(
            coverPicUrl,
            fit: BoxFit.fill,
          ))
        ],
      ),
    );
  }

  Widget _content(data) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          _title(data),
          Row(
            children: (data.shootingPlaceLableList as List).asMap().keys.map((index) {
              return _tip(data.shootingPlaceLableList[index],index);
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget _title(data) {
    return Container(
      child: Row(
        children: <Widget>[
          Text(
            data.name,
            style: TextStyle(
                fontSize: ScreenUtil().setSp(28), fontWeight: FontWeight.w500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                '${data.score.toString()}分',
                style: TextStyle(
                    color: Color(0xFFFF1919),
                    fontSize: ScreenUtil().setSp(28),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Image.asset('assets/images/didian.png',
              width: ScreenUtil().setWidth(32),
              height: ScreenUtil().setHeight(38)),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              data.address,
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
          )
        ],
      ),
    );
  }

  Widget _tip(item,index) {
    index = index % lableColor.length;
    return Container(
      margin: EdgeInsets.only(top: 10, right: 10),
      padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: lableColor[index.toString()])),
      child: Align(
        child: Text(
          item.lable.name,
          style: TextStyle(
              color: lableColor[index.toString()], fontSize: ScreenUtil().setSp(20)),
        ),
        alignment: Alignment.center,
      ),
    );
  }

}
