import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        title:Text('设置',
          style: new TextStyle(
            color: const Color(0xFF333333),
            fontSize: 17
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.keyboard_arrow_left),
        ),
        iconTheme:IconThemeData(
          color: const Color(0xFF333333),
          size: 36)
      ),
      body: Center(
        child: Text('设置'),
      ),
    );
  }
}
