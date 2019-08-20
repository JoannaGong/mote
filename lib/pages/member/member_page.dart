import 'package:flutter/material.dart';
import 'package:mote/pages/member/settings.dart';

class MemberPage extends StatelessWidget {
  const MemberPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 18),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()));
              },
              child: Image(
                width: 20,
                height: 22,
                image: AssetImage('assets/images/settings.png'),
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipOval(
                  child: SizedBox(
                      width: 60,
                      height: 60,
                      child: Image.asset('assets/images/avatar.jpeg')),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
