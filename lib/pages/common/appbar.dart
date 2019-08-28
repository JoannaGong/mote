import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppbarPage extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppbarPage({Key key,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      brightness: Brightness.light,
      title: Text(title,
          style: TextStyle(
              color: Color(0xFF333333), fontSize: ScreenUtil().setSp(34))),
      leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Color(0xFF333333),
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => getSize();

  Size getSize(){
    return new Size(100.0, 100.0);
  }
}
