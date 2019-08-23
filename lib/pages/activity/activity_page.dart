import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/appbar/appbar_page.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBarPage(title: '活动报名',),
      body: Container(
        padding: EdgeInsets.all(10),
      ),
    );
  }
}
