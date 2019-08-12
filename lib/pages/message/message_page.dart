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
                  
                  
                  
                ],
              ),
            )));
  }
}

class __topListView extends State <MessagePage> {
  @override
  // TODO: implement widget
  widget _
}
