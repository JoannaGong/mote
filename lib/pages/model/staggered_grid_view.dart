import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mote/model_data/model/modeListModel.dart';
import 'package:provide/provide.dart';
import '../../provide/model.dart';

class StaggeredGrid extends StatefulWidget {
  final List modelList;
  const StaggeredGrid({Key key, this.modelList}) : super(key: key);

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
  void initState() {
    _loadData();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: _handleRefresh,
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: new StaggeredGridView.countBuilder(
          controller: _scrollController,
          crossAxisCount: 4,
          itemCount: 19,
          primary: false,
          itemBuilder: (BuildContext context, int index) => _ModelItem(
            index:index,
            item:modelItems[index]
          ),
          staggeredTileBuilder: (int index) =>
              new StaggeredTile.fit(2),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
      ),
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

    Provide.value<ModelProvide>(context).getmodelList(
        {'pageNum': pageIndex, 'roleName': 2}).then((ModelListModel model) {
      print(model);
    });
  }
}

Future<Null> _handleRefresh() async {
  return null;
}

class _ModelItem extends StatelessWidget {
  final ModelList item;
  final int index;

  const _ModelItem({Key key, this.item, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: PhysicalModel(
          color: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[_itemImage()],
          ),
        ),
      ),
    );
  }

  _itemImage() {
    return Image(
      image: NetworkImage(item.headUrl),
    );
  }
}
