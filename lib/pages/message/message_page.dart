import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './contact/contact_list.dart';
import './chat/chat_list.dart';
import './notice/system_notice.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('消息',
              style: TextStyle(
                  color: Colors.black, fontSize: ScreenUtil().setSp(34.0))),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Container(
          color: Color(0xFFF5F5F5),
          child: Column(
            children: <Widget>[
              Container(
                height: ScreenUtil().setHeight(304.0),
                margin: EdgeInsets.fromLTRB(15, 20, 16, 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0)
                ),
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: Text('消息聊天',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: ScreenUtil().setSp(32.0),
                          )),
                      leading: Icon(
                        Icons.account_box,
                        color: Colors.lightBlue,
                        size: ScreenUtil().setSp(88.0),
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatList(userId: '00f2128263cc41b0a6c049fe64eca90d')));
                      },
                      // contentPadding: EdgeInsets.all(4.0),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('系统通知',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: ScreenUtil().setSp(32.0),
                          )),
                      leading: Icon(
                        Icons.account_box,
                        color: Colors.lightBlue,
                        size: ScreenUtil().setSp(88.0),
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SystemNotice(userId: '00f2128263cc41b0a6c049fe64eca90d')));
                      },
                      // contentPadding: EdgeInsets.all(4.0),
                    ),
                  ],
                ),
              ),
              Container(
                height: ScreenUtil().setHeight(152),
                margin: EdgeInsets.fromLTRB(15, 0, 16, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0)
                ),
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: Text('通讯录',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: ScreenUtil().setSp(32.0),
                          )),
                      leading: Icon(
                        Icons.account_box,
                        color: Colors.lightBlue,
                        size: ScreenUtil().setSp(88.0),
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ContactList(userId: '00f2128263cc41b0a6c049fe64eca90d')));
                      },
                      // contentPadding: EdgeInsets.all(4.0),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}