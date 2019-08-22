import 'package:flutter/material.dart';
import '../common/search/serch_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mote/pages/model/staggered_grid_view.dart';


class ModelPage extends StatefulWidget {
  @override
  _ModelState createState() => _ModelState();
}

class _ModelState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          brightness: Brightness.light,
          title: Search(
            text: '外模',
            router: '/detail',
          ),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top:ScreenUtil().setHeight(110)),
                child: StaggeredGrid()
              ),
              FiltratePanel()
            ],
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
