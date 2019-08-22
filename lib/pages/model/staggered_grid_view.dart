import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mote/model_data/model/modeListModel.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:provide/provide.dart';
import '../../provide/model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StaggeredGrid extends StatefulWidget {
  @override
  _StaggeredGridState createState() => _StaggeredGridState();
}

class _StaggeredGridState extends State<StaggeredGrid>
    with AutomaticKeepAliveClientMixin {
  ScrollController _scrollController = new ScrollController();

  List<ModelList> modelItems;
  int pageIndex = 1;

  var posts = [];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(50)),
      child: FutureBuilder(
          future: _getModelInfo(context),
          builder: (context, snapsshot) {
            if (snapsshot.hasData) {
              return Container(
                child: EasyRefresh(
                  header: BallPulseHeader(color: Color(0xFFFF5658)),
                  footer: BallPulseFooter(),
                  onRefresh: () async {
                    _loadData();
                  },
                  onLoad: () async {
                    _loadData(loadMore: true);
                  },
                  child: Provide<ModelProvide>(
                    builder: (context, child, val) {
                      var cardItem = Provide.value<ModelProvide>(context).list;
                      return StaggeredGridView.countBuilder(
                        controller: _scrollController,
                        shrinkWrap: true,
                        crossAxisCount: 4,
                        itemCount: cardItem?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) =>
                            TileCard(
                                headUrl: '${cardItem[index].headUrl}',
                                name: '${cardItem[index].name}',
                                coverUrl: '${cardItem[index].coverUrl}'),
                        staggeredTileBuilder: (int index) =>
                            new StaggeredTile.fit(2),
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0,
                      );
                    },
                  ),
                ),
              );
            } else {
              return Container();
            }
          }),
    ));
  }

  @override
  bool get wantKeepAlive => true;

  void _loadData({loadMore = false}) {
    if (loadMore) {
      pageIndex++;
    } else {
      pageIndex = 1;
    }
    _getModelInfo(context);
  }

  Future _getModelInfo(BuildContext context) async {
    Provide.value<ModelProvide>(context).getmodelList(pageIndex);
    return '完成加载';
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadData(loadMore: true);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }
}

Future<Null> _handleRefresh() async {
  return null;
}

class TileCard extends StatelessWidget {
  final String headUrl;
  final String name;
  final String coverUrl;

  TileCard({this.headUrl, this.name, this.coverUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Column(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0)),
              child: Image(
                image: NetworkImage('$headUrl'),
                fit: BoxFit.fitWidth,
                width: 200,
              )),
          Container(
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(20),
                bottom: ScreenUtil().setWidth(20),
                top: ScreenUtil().setWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage('$headUrl'),
                  radius: ScreenUtil().setWidth(30),
                  // maxRadius: 40.0,
                ),
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                  width: ScreenUtil().setWidth(250),
                  child: Text(
                    '$name',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(25),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
