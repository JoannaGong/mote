import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarPage extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFF5F5F5),
      elevation: 0,
      brightness: Brightness.light,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.keyboard_arrow_left,
          color: Color(0xFF333333),
          size: 30,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
            color: Color(0xFF333333), fontSize: ScreenUtil().setSp(34)),
      ),
    );
  }
}
