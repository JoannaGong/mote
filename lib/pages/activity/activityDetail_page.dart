import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:async/src/async_memoizer.dart';

class ActivityDetailPage extends StatelessWidget {
  final String id;
  const ActivityDetailPage({Key key,this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(id),
    );
  }
}