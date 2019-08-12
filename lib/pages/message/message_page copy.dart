import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String cowUrl = 'https://i.stack.imgur.com/XPOr3.png';

class MessagePage extends StatelessWidget {
  const MessagePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          title: new Text('消息',
              style: TextStyle(
                  color: Colors.black, fontSize: ScreenUtil().setSp(17.0))),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Container(
            padding: const EdgeInsets.fromLTRB(15.0, 20.0, 16.0, 225.0),
            color: Color(0xFFF5F5F5),
            child: Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                // borderRadius: new BorderRadius.circular(ScreenUtil().setSp(16.0))
              ),
              child: new ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    height: ScreenUtil().setHeight(78.0),
                    decoration: new BoxDecoration(
                      border: Border(bottom: Divider.createBorderSide(context, color: Color(0xFFE2E2E2)))
                    ),
                    alignment: Alignment.center,
                    child: new ListTile(
                      title: new Text('消息聊天',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: ScreenUtil().setSp(16.0),
                          )),
                      leading: new Icon(
                        Icons.account_box,
                        color: Colors.lightBlue,
                        size: ScreenUtil().setSp(44.0),
                      ),
                    ),
                  ),
                  Container(
                    height: ScreenUtil().setHeight(78.0),
                    alignment: Alignment.center,
                    // margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                    child: new ListTile(
                      title: new Text('系统通知',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: ScreenUtil().setSp(16.0),
                          )),
                      leading: new Icon(
                        Icons.account_box,
                        color: Colors.lightBlue,
                        size: ScreenUtil().setSp(44.0),
                      ),
                    ),
                  ),
                  Container(
                    height: ScreenUtil().setHeight(78.0),
                    alignment: Alignment.center,
                    child: new ListTile(
                      title: new Text('通讯录',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: ScreenUtil().setSp(16.0),
                          )),
                      leading: new Icon(
                        Icons.account_box,
                        color: Colors.lightBlue,
                        size: ScreenUtil().setSp(44.0),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
