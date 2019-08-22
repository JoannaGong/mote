import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/home.dart';

//推荐模特
class RecommendModel extends StatelessWidget {
  const RecommendModel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provide<HomeProvide>(
      builder: (context, child, val) {
        var isModel = Provide.value<HomeProvide>(context).isModel;
        var modelData =
            Provide.value<HomeProvide>(context).modelData.data.pageInfo.list;

        return Container(
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
          child: Column(
            children: <Widget>[_title(context, isModel), _modelList(modelData)],
          ),
        );
      },
    );
  }

  //标题栏
  Widget _title(BuildContext context, isModel) {
    return Container(
      height: ScreenUtil().setHeight(60),
      padding: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(20), 0, ScreenUtil().setWidth(20), 0),
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
                Provide.value<HomeProvide>(context).changeModel(true);
                Provide.value<HomeProvide>(context).getModelList(2);
              },
              child: Text(
                '模特',
                style: TextStyle(
                    fontSize: isModel
                        ? ScreenUtil().setSp(36)
                        : ScreenUtil().setSp(30),
                    fontWeight: isModel ? FontWeight.w500 : FontWeight.w300,
                    color: isModel ? Colors.black : Color(0xFF999999)),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
              child: GestureDetector(
                onTap: () {
                  Provide.value<HomeProvide>(context).changeModel(false);
                  Provide.value<HomeProvide>(context).getModelList(3);
                },
                child: Text(
                  '经纪',
                  style: TextStyle(
                      fontSize: isModel
                          ? ScreenUtil().setSp(30)
                          : ScreenUtil().setSp(36),
                      fontWeight: isModel ? FontWeight.w300 : FontWeight.w500,
                      color: isModel ? Color(0xFF999999) : Colors.black),
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

  //内容
  Widget _model(item) {
    return Container(
        margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              width: ScreenUtil().setWidth(219),
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(boxShadow: [
                //BoxShadow中Offset (1,1)右下，(-1,-1)左上,(1,-1)右上,(-1,1)左下
                BoxShadow(
                    color: Color(0xFFF5F5F5),
                    offset: Offset(1, 1),
                    blurRadius: 5),
              ]),
              child: Column(
                children: <Widget>[
                  Image.network(
                    item.headUrl,
                    width: ScreenUtil().setWidth(218),
                    height: ScreenUtil().setWidth(218),
                    fit: BoxFit.fill,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(10))),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: ScreenUtil().setWidth(20),
                            backgroundImage: NetworkImage(item.headUrl),
                            backgroundColor: Colors.white,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: ScreenUtil().setWidth(10)),
                            child: Text(
                              item.name,
                              style:
                                  TextStyle(fontSize: ScreenUtil().setSp(24)),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )));
  }

  //列表
  Widget _modelList(data) {
    return Container(
      height: 150,
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(15), top: ScreenUtil().setHeight(20)),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _model(data[index]);
        },
      ),
    );
  }
}
