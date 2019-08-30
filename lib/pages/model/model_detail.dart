import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mote/pages/model/detail_intro.dart';

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
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Container(child: SAppBar()),
            Positioned(
                bottom: 0,
                child: Container(
                  height: ScreenUtil().setHeight(196),
                  width: ScreenUtil().setWidth(750),
                  padding: EdgeInsets.symmetric(vertical:  ScreenUtil().setHeight(20),horizontal: ScreenUtil().setHeight(32)),
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      new BoxShadow(
                        color: Color.fromRGBO(219, 219, 219, 0.5), //阴影颜色
                        blurRadius: 20.0, //阴影大小
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: ScreenUtil().setWidth(260),
                          height: ScreenUtil().setHeight(88),
                          child: Text('联系',style:TextStyle(color: Color(0xFFFF5658),fontSize: ScreenUtil().setSp(34),fontWeight: FontWeight.w500)),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Color(0xFFFF5658)),
                            borderRadius: new BorderRadius.all(Radius.circular(44)),
                            boxShadow: [BoxShadow(color: Color(0x80FFABAC),blurRadius:8,offset: Offset(0, 4))]
                          ),
                        ),
                      ),
                       GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: ScreenUtil().setWidth(394),
                          height: ScreenUtil().setHeight(88),
                          child: Text('预约',style:TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(34),fontWeight: FontWeight.w500)),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFFFF9E9F),Color(0xFFFF5658)]
                            ),
                            borderRadius: new BorderRadius.all(Radius.circular(44)),
                            boxShadow: [BoxShadow(color: Color(0x80FFABAC),blurRadius:8,offset: Offset(0, 4))],
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}

class SAppBar extends StatefulWidget {
  @override
  _SAppBarState createState() => _SAppBarState();
}

class _SAppBarState extends State<SAppBar> with SingleTickerProviderStateMixin {
  ScrollController _scrollViewController;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
              leading: IconButton(
                  icon: IconButton(
                    icon: Image.asset(
                      'assets/images/back_white.png',
                      width: ScreenUtil().setWidth(40),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              actions: <Widget>[
                IconButton(
                  icon: Image.asset(
                    'assets/images/launch.png',
                    width: ScreenUtil().setWidth(37),
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Image.asset(
                    'assets/images/settings_2.png',
                    width: ScreenUtil().setWidth(40),
                  ),
                  onPressed: () {},
                ),
              ],
              brightness: Brightness.light,
              backgroundColor: Color(0xFFFF5658),
              elevation: 0,
              primary: true, //是否预留高度
              forceElevated: false,
              titleSpacing: NavigationToolbar.kMiddleSpacing,
              expandedHeight: ScreenUtil().setWidth(580), //展开高度
              pinned: true, //是否固定在顶部
              flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  centerTitle: true,
                  background: FilterImage()),
              bottom: PreferredSize(
                child: Material(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    child: Column(
                      children: <Widget>[
                        TabBar(
                            labelPadding: EdgeInsets.only(
                                top: ScreenUtil().setHeight(10),
                                bottom: ScreenUtil().setHeight(6)),
                            controller: _tabController,
                            unselectedLabelColor: Color(0xFF333333),
                            labelColor: Color(0xFFFF5658),
                            indicatorWeight: ScreenUtil().setHeight(4),
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: Color(0xFFFF8F91),
                            labelStyle: TextStyle(
                                fontSize: ScreenUtil().setSp(32),
                                fontWeight: FontWeight.w500),
                            tabs: [
                              Tab(text: "简介"),
                              Tab(text: "作品"),
                              Tab(text: "服务记录"),
                            ]),
                        Container(
                          height: 0.5,
                          color: Color(0xFFE2E2E2),
                        )
                      ],
                    )),
                preferredSize: Size.fromHeight(60),
              ))
        ];
      },
      body: TabBarView(
          controller: _tabController,
          children: [Intro(), Intro(), Intro()]),
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
        top: ScreenUtil().setWidth(200),
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
                      padding: EdgeInsets.all(ScreenUtil().setWidth(4)),
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
                              fontSize: ScreenUtil().setSp(36),
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
                              fontSize: ScreenUtil().setSp(28),
                            )),
                      ),
                      Text('模特',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(28),
                          ))
                    ]),
                    SizedBox(
                      child: OutlineButton(
                          onPressed: () {},
                          child: Text('收藏',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ScreenUtil().setSp(24))),
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
      )
    ]);
  }
}
