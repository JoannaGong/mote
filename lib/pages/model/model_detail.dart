import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModelDetail extends StatelessWidget {
  final String id;
  ModelDetail({this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ModelDetailPage(),
    );
  }
}

class ModelDetailPage extends StatefulWidget {
  @override
  _ModelDetailPageState createState() => _ModelDetailPageState();
}

class _ModelDetailPageState extends State<ModelDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: Container(
                  color: Colors.white,
                  child: ListView(
                    children: <Widget>[FilterImage()],
                  ),
                )),
            TopAppBar(),
          ],
        ));
  }
}

class TopAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(24),
          ScreenUtil().setHeight(112),
          ScreenUtil().setWidth(10),
          ScreenUtil().setHeight(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: IconButton(
              icon: Image.asset(
                'assets/images/back_white.png',
                width: ScreenUtil().setWidth(44),
              ),
              onPressed: () {},
            ),
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: Image.asset(
                  'assets/images/launch.png',
                  width: ScreenUtil().setWidth(44),
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset(
                  'assets/images/settings_2.png',
                  width: ScreenUtil().setWidth(44),
                ),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}

class FilterImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image(
          image: AssetImage('assets/images/2.png'),
          width: ScreenUtil().setWidth(750),
          fit: BoxFit.fitWidth),
      BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: new Container(
          color: Color(0x33000000).withOpacity(0.2),
          width: ScreenUtil().setWidth(750),
          height: ScreenUtil().setWidth(750),
        ),
      ),
      Positioned(
        top: ScreenUtil().setWidth(222),
        child: Container(
          width: ScreenUtil().setWidth(750),
          padding: EdgeInsets.fromLTRB(
              ScreenUtil().setWidth(32), 0, ScreenUtil().setWidth(32), 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipOval(
                  child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(ScreenUtil().setWidth(6)),
                      width: ScreenUtil().setWidth(128),
                      height: ScreenUtil().setWidth(128),
                      child: ClipOval(
                          child: Image.asset(
                        'assets/images/2.png',
                        fit: BoxFit.fitWidth,
                      )))),
              Padding(
                padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(32),
                    bottom: ScreenUtil().setHeight(40)),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.only(right: ScreenUtil().setHeight(32)),
                      child: Text('金闪闪',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setWidth(36),
                              fontWeight: FontWeight.w600)),
                    ),
                    Image.asset('assets/images/female.png',
                        width: ScreenUtil().setWidth(36),
                        height: ScreenUtil().setWidth(36))
                  ],
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Image.asset('assets/images/location.png',
                          width: ScreenUtil().setWidth(28)),
                      Padding(
                        padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(20),
                            right: ScreenUtil().setWidth(20)),
                        child: Text('中国·上海',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setWidth(28),
                            )),
                      ),
                      Text('模特',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setWidth(28),
                          ))
                    ]),
                    SizedBox(
                      child: OutlineButton(
                          onPressed: () {},
                          child: Text('收藏',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ScreenUtil().setWidth(24))),
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: ScreenUtil().setWidth(2)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(ScreenUtil().setWidth(30)))),
                          padding: EdgeInsets.all(0)),
                      width: ScreenUtil().setWidth(100),
                      height: ScreenUtil().setHeight(46),
                    )
                  ])
            ],
          ),
        ),
      ),
      Positioned(
        top: ScreenUtil().setHeight(560),
        child: ModelInfo(),
      )
    ]);
  }
}

class ModelInfo extends StatefulWidget {
  @override
  _ModelInfoState createState() => _ModelInfoState();
}

class _ModelInfoState extends State<ModelInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('tar'),
    );
  }
  
  
}
