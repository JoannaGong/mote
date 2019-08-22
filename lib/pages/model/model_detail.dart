import 'package:flutter/material.dart';

class ModelDetail extends StatelessWidget {
  final String id;
  ModelDetail({this.id});
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          brightness: Brightness.light,
        ),
        body: Container(
          color: Colors.black,
        ),
      ),
    );
  }
}
