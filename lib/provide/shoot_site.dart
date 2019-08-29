import 'package:flutter/material.dart';
import '../service/service_method.dart';
import '../model_data/shootSite/shoot_site_data.dart';
import '../pages/common/toast.dart';

class ShootSiteProvide with ChangeNotifier {
  ShootSiteModel shootSitedata;
  List<ShootSiteList> list;

  int pageNum = 1;

  //获取拍摄地列表
  getShootSiteList(bool type) async {
    if (type) {
      pageNum++;
    } else {
      pageNum = 1;
    }

    var formData = {'pageNum': pageNum};
    
    await requestGet('shootingPlace', formData: formData).then((val) {
      shootSitedata = ShootSiteModel.fromJson(val);
      if (type) {
        if (!shootSitedata.data.pageInfo.isLastPage) {
          list.addAll(shootSitedata.data.pageInfo.list);
        } else {
          showToast('无更多数据');
        }
      } else {
        list = shootSitedata.data.pageInfo.list;
      }
      notifyListeners();
    });
  }
}
