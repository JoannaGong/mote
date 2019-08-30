import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
       padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(250)),
        child: ListView(
          padding: EdgeInsets.only(top: ScreenUtil().setHeight(37)),
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(26)),
              height: ScreenUtil().setHeight(320),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  GestureDetector(
                    child: _imageListItem(),
                  ),
                  _imageListItem(),
                  _imageListItem(),
                  _imageListItem(),
                  _imageListItem(),
                  _imageListItem(),
                ],
              ),
            ),
            _modelInfo(),
            _signInfo(),
            _workExperience('工作经验', '平面工作4年，是ESSE公司的御用模特'),
            _workExperience('服务报价', '议价预约  时装拍摄 平面拍摄 面议'),
          ],
        )
    );
  }

  Widget _imageListItem() {
    return Padding(
      padding: EdgeInsets.only(right: ScreenUtil().setWidth(32)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.0),
        child: SizedBox(
          width: ScreenUtil().setWidth(240),
          height: ScreenUtil().setWidth(320),
          child: Image.network(
            'https://zkong-model.oss-cn-hangzhou.aliyuncs.com/231566371028_.picBtIxYbNB.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

   Widget _modelInfo() {
    return Container(
      padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(55),
          right: ScreenUtil().setHeight(32),
          left: ScreenUtil().setHeight(32)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _title('模特信息'),
          Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: _infoItem('身高:', '1'),
              ),
              Flexible(
                flex: 1,
                child: _infoItem('体重:', '1'),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: _infoItem('胸围:', '1'),
              ),
              Flexible(
                flex: 1,
                child: _infoItem('腰围:', '1'),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: _infoItem('臀围:', '1'),
              ),
              Flexible(
                flex: 1,
                child: _infoItem('鞋码:', '1'),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: _infoItem('头发颜色:', '1'),
              ),
            ],
          ),
          Container(
            height: 0.5,
            color: Color(0xFFE2E2E2),
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(53)),
          )
        ],
      ),
    );
  }

  Widget _signInfo() {
    return Container(
      padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(55),
          right: ScreenUtil().setHeight(32),
          left: ScreenUtil().setHeight(32)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _title('个性标签'),
          _signItem('风格标签:', ['1', '1']),
          _signItem('外貌标签:', ['1', '1']),
          _signItem('体型标签:', ['1', '1']),
          _signItem('魅力部位:', ['1', '1']),
          Container(
            height: 0.5,
            color: Color(0xFFE2E2E2),
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(53)),
          )
        ],
      ),
    );
  }

  Widget _workExperience(String t, String s) {
    return Container(
      padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(55),
          right: ScreenUtil().setHeight(32),
          left: ScreenUtil().setHeight(32)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _title('$t'),
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(29)),
            child: Text(
              '$s',
              style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: ScreenUtil().setSp(26),
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            height: 0.5,
            color: Color(0xFFE2E2E2),
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(53)),
          )
        ],
      ),
    );
  }

  Widget _title(String title) {
    return Text('$title',
        style: TextStyle(
            fontSize: ScreenUtil().setSp(31), fontWeight: FontWeight.w500));
  }

  Widget _infoItem(String title, String content) {
    return Padding(
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(29)),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: ScreenUtil().setHeight(29)),
            child: Text(
              '$title',
              style: TextStyle(
                  color: Color(0xFF999999), fontSize: ScreenUtil().setSp(26)),
            ),
          ),
          Text(
            '$content',
            style: TextStyle(
                color: Color(0xFF333333), fontSize: ScreenUtil().setSp(26)),
          )
        ],
      ),
    );
  }

  Widget _signItem(String title, List<String> content) {
    return Padding(
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(29)),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: ScreenUtil().setHeight(29)),
            child: Text(
              '$title',
              style: TextStyle(
                  color: Color(0xFF999999), fontSize: ScreenUtil().setSp(26)),
            ),
          ),
          Row(
            children: content.map((item) {
              return Padding(
                padding: EdgeInsets.only(right: ScreenUtil().setHeight(50)),
                child: Text(
                  '$item',
                  style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: ScreenUtil().setSp(26)),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}