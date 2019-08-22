import 'package:flutter/material.dart';

class ModelDetail extends StatelessWidget {
  final String id;
  ModelDetail({this.id});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('$id'),
    );
  }
}
