import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/home.dart';

//推荐摄影
class RecommendShoot extends StatelessWidget {
  const RecommendShoot({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provide<HomeProvide>(
      builder: (context, child, val) {
        var isShoot = Provide.value<HomeProvide>(context).isShoot;
        var cameramanData = Provide.value<HomeProvide>(context).cameramanData.data.pageInfo.list;
        
        return Container(
          margin: EdgeInsets.only(top: 30.0),
          child: Column(
            children: <Widget>[_title(context, isShoot), _headPortrait(cameramanData)],
          ),
        );
      },
    );
  }

  //标题栏
  Widget _title(BuildContext context, isShoot) {
    return Container(
      height: ScreenUtil().setHeight(60),
      padding: EdgeInsets.fromLTRB(
          ScreenUtil().setHeight(20), 0, ScreenUtil().setHeight(20), 0),
      child: Row(
        children: <Widget>[
          Text('推荐',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(36),
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
            child: GestureDetector(
              onTap: () {
                Provide.value<HomeProvide>(context).changeShoot(true);
                Provide.value<HomeProvide>(context).getShootlList(0);
              },
              child: Text(
                '摄影',
                style: TextStyle(
                    fontSize: isShoot
                        ? ScreenUtil().setSp(36)
                        : ScreenUtil().setSp(30),
                    fontWeight: isShoot ? FontWeight.w500 : FontWeight.w300,
                    color: isShoot ? Colors.black : Color(0xFF999999)),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
              child: GestureDetector(
                onTap: () {
                  Provide.value<HomeProvide>(context).changeShoot(false);
                  Provide.value<HomeProvide>(context).getShootlList(1);
                },
                child: Text(
                  '化妆',
                  style: TextStyle(
                      fontSize: isShoot
                          ? ScreenUtil().setSp(30)
                          : ScreenUtil().setSp(36),
                      fontWeight: isShoot ? FontWeight.w300 : FontWeight.w500,
                      color: isShoot ? Color(0xFF999999) : Colors.black),
                ),
              )),
          Expanded(
            child: Align(
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  '更多',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(24),
                      color: Color(0xFF999999)),
                ),
              ),
              alignment: Alignment.centerRight,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
            size: ScreenUtil().setSp(36),
          )
        ],
      ),
    );
  }

  //头像
  Widget _headPortrait(item) {
    return Container(
      height: 100,
      padding: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(20), 0, 0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: item.length,
        itemBuilder: (context,index){
          return _item(item[index]);
        },
      ),
    );
  }

  //内容
  Widget _item(data) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: ScreenUtil().setWidth(130),
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(5)),
                padding: EdgeInsets.fromLTRB(
                    ScreenUtil().setWidth(10),
                    ScreenUtil().setHeight(10),
                    ScreenUtil().setWidth(10),
                    ScreenUtil().setHeight(10)),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0xFFFF7E80)),
                    borderRadius: BorderRadius.circular(100)),
                child: CircleAvatar(
                  radius: ScreenUtil().setWidth(40),
                  backgroundImage: NetworkImage(data.headUrl),
                  backgroundColor: Colors.white,
                )),
            Text(
              data.name,
              style: TextStyle(fontSize: ScreenUtil().setSp(20)),
            )
          ],
        ),
      ),
    );
  }

}