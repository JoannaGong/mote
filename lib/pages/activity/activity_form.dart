import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityForm extends StatefulWidget {
  ActivityForm({Key key}) : super(key: key);

  _ActivityFormState createState() => _ActivityFormState();
}

class _ActivityFormState extends State<ActivityForm> {
  GlobalKey _formKey = new GlobalKey<FormState>();

  String value = '0';

  void onChange(v) {
    this.setState(() {
      value = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('填写信息',
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
      ),
      body: Container(
          color: Color(0xFFF5F5F5),
          child: Stack(
            children: <Widget>[
              Form(
                key: _formKey,
                autovalidate: false,
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                    children: <Widget>[
                      _nameText(),
                      // _gender(),
                      _phoneText(),
                      _workText(),
                      _remarksText()
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                child: Container(
                  color: Colors.white,
                  width: ScreenUtil().setWidth(750),
                  height: ScreenUtil().setHeight(182),
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      
                    },
                    child: Container(
                      width: ScreenUtil().setWidth(686),
                      height: ScreenUtil().setHeight(88),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(40),
                        gradient: const LinearGradient(colors: [
                          Color(0xFFFF9E9F),
                          Color(0xFFFF5658),
                        ]),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFFFF5153),
                              offset: Offset(1, 1),
                              blurRadius: 2,
                              spreadRadius: 0.1),
                        ],
                      ),
                      child: Text(
                        '提交报名',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(34)),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }

  Widget _nameText() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 0.5, color: Color(0xFFE2E2E2)))),
        child: Row(
          children: <Widget>[
            Text(
              '姓名',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(30),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 10),
                child: TextFormField(
                  maxLines: 1,
                  textAlign: TextAlign.end,
                  decoration: InputDecoration(
                    hintText: '填写你的姓名',
                    hintStyle: TextStyle(
                        fontSize: ScreenUtil().setSp(30),
                        fontWeight: FontWeight.w300),
                    border: InputBorder.none,
                  ),
                  validator: (String value) {
                    return value.trim().length > 0 ? null : '姓名不能为空';
                  },
                  onSaved: (String value) {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _phoneText() {
    return Container(
        padding: EdgeInsets.only(left: 10),
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 0.5, color: Color(0xFFE2E2E2)))),
          child: Row(
            children: <Widget>[
              Text(
                '联系方式',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(30),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(right: 10),
                  child: TextFormField(
                    maxLines: 1,
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                      hintText: '填写手机号码',
                      hintStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(30),
                          fontWeight: FontWeight.w300),
                      border: InputBorder.none,
                    ),
                    validator: (String value) {
                      var phoneReg = RegExp(
                          r"(((13[0-9]{1})|(15[0-9]{1})|(16[0-9]{1})|(17[3-8]{1})|(18[0-9]{1})|(19[0-9]{1})|(14[5-7]{1}))+\d{8})");
                      if (!phoneReg.hasMatch(value)) {
                        return '请输入正确的手机号';
                      }
                    },
                    onSaved: (String value) {},
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget _workText() {
    return Container(
        padding: EdgeInsets.only(left: 10),
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 0.5, color: Color(0xFFE2E2E2)))),
          child: Row(
            children: <Widget>[
              Text(
                '工作单位',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(30),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(right: 10),
                  child: TextFormField(
                    maxLines: 1,
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                      hintText: '填写工作单位',
                      hintStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(30),
                          fontWeight: FontWeight.w300),
                      border: InputBorder.none,
                    ),
                    validator: (String value) {},
                    onSaved: (String value) {},
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget _remarksText() {
    return Container(
        padding: EdgeInsets.only(left: 10),
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 0.5, color: Color(0xFFE2E2E2)))),
          child: Row(
            children: <Widget>[
              Text(
                '备注留言',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(30),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(right: 10),
                  child: TextFormField(
                    maxLines: 1,
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    validator: (String value) {},
                    onSaved: (String value) {},
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget _gender() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 10),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 0.5, color: Color(0xFFE2E2E2)))),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                '性别',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(30),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RadioListTile(
                        activeColor: Color(0xFFFF5658),
                        title: Text('女'),
                        value: '1',
                        groupValue: this.value,
                        onChanged: onChange,
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        activeColor: Color(0xFFFF5658),
                        title: Text('男'),
                        value: '0',
                        groupValue: this.value,
                        onChanged: onChange,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
