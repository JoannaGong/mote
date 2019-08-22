import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/home.dart';

//作品推荐
class RecommendProduction extends StatelessWidget {
  const RecommendProduction({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provide<HomeProvide>(
      builder: (context, child, val) {
        var productionList = Provide.value<HomeProvide>(context).productionData.data.pageInfo.list;
        return Container(
          child: Column(
            children: <Widget>[
              _title(),
              Container(
                height: 250,
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(15)),
                child: Wrap(
                    spacing: 3,
                    children: productionList.map((item) {
                      return _gridViewItemUI(context, item);
                    }).toList()),
              )
            ],
          ),
        );
      },
    );
  }

  //标题栏
  Widget _title() {
    return Container(
      height: ScreenUtil().setHeight(60),
      padding: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(20), 0, ScreenUtil().setWidth(20), 0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              '作品推荐',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(36),
                  fontWeight: FontWeight.w500),
            ),
          ),
          Icon(
            Icons.cached,
            color: Colors.grey,
            size: ScreenUtil().setSp(36),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              '换一换',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(24), color: Color(0xFF999999)),
            ),
          ),
          Text(
            ' | ',
            style: TextStyle(color: Color(0xFF999999)),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              '更多',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(24), color: Color(0xFF999999)),
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

  Widget _gridViewItemUI(BuildContext context, item) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: GestureDetector(
        onTap: () {
          print(item);
        },
        child: Stack(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(210),
              height: ScreenUtil().setWidth(210),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  item.coverUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: ScreenUtil().setWidth(20),
              bottom: 10,
              child: Text(
                item.worksLableList[0].lable.name,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
