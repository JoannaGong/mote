// import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:async/src/async_memoizer.dart';
import 'package:route_annotation/route_annotation.dart';

import '../../main.route.dart';

import '../../provide/activity.dart';

final AsyncMemoizer _memoizer = AsyncMemoizer();
final status = {
  '0': '未开始报名',
  '1': '报名进行中',
  '2': '报名截止活动未开始',
  '3': '活动进行中',
  '4': '活动结束'
};
final statusColor = {
  '0': Color(0xFF999999),
  '1': Color(0xFF999999),
  '2': Color(0xFF999999),
  '3': Color(0xFFFF1919),
  '4': Color(0xFF999999)
};

@RoutePage()
class ActivityPage extends StatelessWidget {
  const ActivityPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
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
        title: Text(
          '活动报名',
          style: TextStyle(
              color: Color(0xFF333333), fontSize: ScreenUtil().setSp(34)),
        ),
      ),
      body: FutureBuilder(
        future: _getActivityList(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding: EdgeInsets.all(15),
              child: ActivityList(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Future _getActivityList(BuildContext context) async {
    return _memoizer.runOnce(() async {
      await Provide.value<ActivityProvide>(context)
          .getActivityList(false); //获取活动列表
      return '完成加载';
    });
  }
}

class ActivityList extends StatelessWidget {
  const ActivityList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provide<ActivityProvide>(
      builder: (context, child, val) {
        var activityList = Provide.value<ActivityProvide>(context).list;
        return Container(
          child: EasyRefresh(
            header: BallPulseHeader(color: Color(0xFFFF5658)),
            footer: BallPulseFooter(color: Color(0xFFFF5658)),
            onRefresh: () async {
              _getActivityList(context, false);
            },
            onLoad: () async {
              _getActivityList(context, true);
            },
            child: ListView.builder(
              itemCount: activityList.length,
              itemBuilder: (context, index) {
                return _item(context, activityList[index]);
              },
            ),
          ),
        );
      },
    );
  }

  void _getActivityList(BuildContext context, bool type) async {
    await Provide.value<ActivityProvide>(context)
        .getActivityList(type); //获取活动列表
  }

  Widget _item(BuildContext context, data) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          ROUTE_ACTIVITY_DETAIL_PAGE,
          arguments: "${data.id}",
        );
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey[200],
                offset: Offset(1, 1),
                blurRadius: 3,
                spreadRadius: 0.1),
          ],
        ),
        margin: EdgeInsets.only(bottom: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            child: Column(
              children: <Widget>[_img(data), _title(data)],
            ),
          ),
        ),
      ),
    );
  }

  Widget _img(item) {
    return Container(
      height: ScreenUtil().setHeight(280),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Image.network(
              item.coverPicUrl,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }

  Widget _title(item) {
    return Container(
      // height: ScreenUtil().setHeight(108),
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: ScreenUtil().setSp(30))),
          ),
          Text(status[item.status.toString()],
              style: TextStyle(
                  color: statusColor[item.status.toString()],
                  fontSize: ScreenUtil().setSp(28)))
        ],
      ),
    );
  }
}
