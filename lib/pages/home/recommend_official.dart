import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/home.dart';

//官方推荐
class RecommendOfficial extends StatelessWidget {
  const RecommendOfficial({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provide<HomeProvide>(
      builder: (context, child, val) {
        var officialList = Provide.value<HomeProvide>(context).officialData.data.pageInfo.list;
        return Container(
          margin: EdgeInsets.fromLTRB(
              0, ScreenUtil().setHeight(20), 0, ScreenUtil().setWidth(20)),
          child: Column(
            children: <Widget>[
              _title(),
              Container(
                padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
                // child: ListView.builder(
                //   itemCount: officialData.length,
                //   itemBuilder: (context, index){
                //     return _item(context, officialData[index]);
                //   },
                // )
                child: Wrap(
                  spacing: 1,
                  children:officialList.map((data) {
                      return _item(context, data);
                    }).toList(),
                ),
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
          ScreenUtil().setHeight(20), 0, ScreenUtil().setHeight(20), 0),
      child: Row(
        children: <Widget>[
          Text(
            '官方推荐',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(36), fontWeight: FontWeight.w500),
          ),
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

  //列表
  Widget _item(BuildContext context, data) {
    return Container(
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.grey[200],
              offset: Offset(1, 1),
              blurRadius: 3,
              spreadRadius: 0.1),
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: <Widget>[
            _itemTitle(context, data),
            _itemContent(context, data)
          ],
        ),
      ),
    );
  }

  Widget _itemTitle(BuildContext context, item) {
    return Container(
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: ScreenUtil().setWidth(30),
            backgroundImage: NetworkImage(item.user.headUrl),
            backgroundColor: Colors.white,
          ),
          Container(
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
            child: Text(
              item.user.name,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(28),
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Align(
              child: GestureDetector(
                onTap: () {},
                child: Image.asset(
                  'assets/images/zan.png',
                  width: ScreenUtil().setWidth(48),
                  height: ScreenUtil().setHeight(42),
                ),
              ),
              alignment: Alignment.centerRight,
            ),
          )
        ],
      ),
    );
  }

  Widget _itemContent(BuildContext context, item) {
    
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(20.0)),
      child: Column(
        children: <Widget>[
          Align(
            child: Text(item.name),
            alignment: Alignment.centerLeft,
          ),
          Container(
            margin: EdgeInsets.only(
                top: ScreenUtil().setHeight(20),
                bottom: ScreenUtil().setHeight(20)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Wrap(
                  spacing: 3,
                  children: (item.worksDetailsList as List).map((val) {
                    return _gridViewItemUI(val);
                  }).toList()),
            ),
          ),
          Row(
            children: <Widget>[_tip()],
          )
        ],
      ),
    );
  }

  Widget _gridViewItemUI(val) {
    return Container(
      margin: EdgeInsets.only(top: 1.5, bottom: 1.5),
      child: GestureDetector(
        onTap: () {},
        child: Stack(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(200),
              height: ScreenUtil().setWidth(200),
              child: Image.network(
                val.resourceUrl,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tip() {
    return Container(
      width: 40,
      height: 18,
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Color(0xFFFFAF3B))),
      child: Align(
        child: Text(
          '夏天',
          style: TextStyle(
              color: Color(0xFFFFAF3B), fontSize: ScreenUtil().setSp(20)),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
