import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../routers/application.dart';

class Search extends StatefulWidget {
  final String text;
  final String router;
  Search({Key key, this.text, this.router}) : super(key: key);

  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Widget _buildTextField(BuildContext context) {
    return Container(
      child: Container(
        height: 20,
        child: Row(
          children: <Widget>[
            Icon(
              Icons.search,
              color: Color(0xFFDBDBDB),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: Text(
                widget.text,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(24), color: Color(0xFF999999)),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Application.router.navigateTo(context, widget.router);
      },
      child: Container(
          //修饰黑色背景与圆角
          decoration: BoxDecoration(
            color: Color(0xFFF5F5F5),
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
          padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
          child: _buildTextField(context)),
    );
  }
}
