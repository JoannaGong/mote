import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:async/src/async_memoizer.dart';

import '../../provide/activity.dart';

final AsyncMemoizer _memoizer = AsyncMemoizer();

class ActivityDetailPage extends StatelessWidget {
  final String id;
  const ActivityDetailPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        body: FutureBuilder(
          future: _getActivityDetail(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Provide<ActivityProvide>(
                builder: (context, child, val) {
                  return NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[_appbar(context)];
                    },
                    body: Container(
                      child: Text('data'),
                    ),
                  );
                },
              );
            }
          },
        ));
  }

  Future _getActivityDetail(BuildContext context) async {
    return _memoizer.runOnce(() async {
      await Provide.value<ActivityProvide>(context)
          .getActivityList(false); //获取活动列表
      return '完成加载';
    });
  }

  Widget _appbar(BuildContext context) {
    return SliverAppBar(
      title: Text(
        '活动详情',
        style: TextStyle(
            color: Color(0xFF333333), fontSize: ScreenUtil().setSp(34)),
      ),
      leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Color(0xFF333333),
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.share,
              color: Color(0xFF333333),
            ),
            onPressed: () {}),
      ],
      brightness: Brightness.light,
      backgroundColor: Color(0xFFF5F5F5),
      elevation: 0,
      primary: true, //是否预留高度
      forceElevated: false,
      automaticallyImplyLeading: true,
      titleSpacing: NavigationToolbar.kMiddleSpacing,
      snap: true, //与floating结合使用
      expandedHeight: 200.0, //展开高度
      floating: true, //是否随着滑动隐藏标题
      pinned: true, //是否固定在顶部
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          background: Image.network(
            "http://b.zol-img.com.cn/desk/bizhi/image/6/960x600/1432800027589.jpg",
            fit: BoxFit.fill,
          )),
    );
  }
}
