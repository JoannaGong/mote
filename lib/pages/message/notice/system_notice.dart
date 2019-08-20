import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

Dio dio = new Dio();

class SystemNotice extends StatefulWidget {
  SystemNotice({Key key, @required this.userId}):super(key:key);
  final String userId;
  @override
  _SystemNoticeState createState() => _SystemNoticeState();
}

class _SystemNoticeState extends State<SystemNotice> {
  int pageNum = 1;
  int pageCount = 10;
  var list = [];
  var total = 0;

  void initState(){
    super.initState();
    getSystemNotice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('系统通知'), centerTitle: true,),
      body: Text('hhh -- ${widget.userId}'),
      // body: ListView.builder(
      
      // ),
    );
  }

  getSystemNotice() async {
    int offset = (pageNum - 1) * pageCount;
    var res = await dio.get('http://101.37.156.106/model_api/addressBookController/addressBook?pageNum=$offset&pageCount=$pageCount&buttonCount=5&sortBy=created_time&orderBy=desc&userId=${widget.userId}');
    print(res);
    var data = res.data.pageInfo;
    setState((){
      list = data['list'];
      total = data['total'];
    });
  }
}


