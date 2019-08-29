import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('找不到页面'),),
      body: Container(
        alignment: Alignment.center,
        child: Text('找不到页面'),
      ),
    );
  }
}