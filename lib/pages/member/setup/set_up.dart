import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:async/src/async_memoizer.dart';
import 'package:provide/provide.dart';
import 'dart:async';

class SetUp extends StatefulWidget {
  @override
  _SetUpState createState() => _SetUpState();
}

class _SetUpState extends State<SetUp> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final AsyncMemoizer _memoizer = AsyncMemoizer();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('个人信息'), centerTitle: true,),
    );
  }
}

