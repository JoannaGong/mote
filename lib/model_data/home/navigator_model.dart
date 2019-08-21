class NavigatorModel {
  int code;
  String msg;
  NavigatorData data;

  NavigatorModel({this.code, this.msg, this.data});

  NavigatorModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new NavigatorData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class NavigatorData {
  List<HomeModuleList> homeModuleList;

  NavigatorData({this.homeModuleList});

  NavigatorData.fromJson(Map<String, dynamic> json) {
    if (json['homeModuleList'] != null) {
      homeModuleList = new List<HomeModuleList>();
      json['homeModuleList'].forEach((v) {
        homeModuleList.add(new HomeModuleList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.homeModuleList != null) {
      data['homeModuleList'] =
          this.homeModuleList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeModuleList {
  String id;
  String name;
  String iconUrl;
  String routingUrl;
  Null orderNo;
  int roleName;
  Null jsonStr;
  String createdUser;
  String createdTime;
  String updatedUser;
  String updatedTime;
  int deleteStatus;
  Null deleteTime;
  Null bak1;
  Null bak2;
  Null bak3;
  Null bak4;
  Null bak5;
  Null bak6;
  Null bak7;
  Null bak8;
  Null bak9;
  Null bak10;

  HomeModuleList(
      {this.id,
      this.name,
      this.iconUrl,
      this.routingUrl,
      this.orderNo,
      this.roleName,
      this.jsonStr,
      this.createdUser,
      this.createdTime,
      this.updatedUser,
      this.updatedTime,
      this.deleteStatus,
      this.deleteTime,
      this.bak1,
      this.bak2,
      this.bak3,
      this.bak4,
      this.bak5,
      this.bak6,
      this.bak7,
      this.bak8,
      this.bak9,
      this.bak10});

  HomeModuleList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    iconUrl = json['iconUrl'];
    routingUrl = json['routingUrl'];
    orderNo = json['orderNo'];
    roleName = json['roleName'];
    jsonStr = json['jsonStr'];
    createdUser = json['createdUser'];
    createdTime = json['createdTime'];
    updatedUser = json['updatedUser'];
    updatedTime = json['updatedTime'];
    deleteStatus = json['deleteStatus'];
    deleteTime = json['deleteTime'];
    bak1 = json['bak1'];
    bak2 = json['bak2'];
    bak3 = json['bak3'];
    bak4 = json['bak4'];
    bak5 = json['bak5'];
    bak6 = json['bak6'];
    bak7 = json['bak7'];
    bak8 = json['bak8'];
    bak9 = json['bak9'];
    bak10 = json['bak10'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['iconUrl'] = this.iconUrl;
    data['routingUrl'] = this.routingUrl;
    data['orderNo'] = this.orderNo;
    data['roleName'] = this.roleName;
    data['jsonStr'] = this.jsonStr;
    data['createdUser'] = this.createdUser;
    data['createdTime'] = this.createdTime;
    data['updatedUser'] = this.updatedUser;
    data['updatedTime'] = this.updatedTime;
    data['deleteStatus'] = this.deleteStatus;
    data['deleteTime'] = this.deleteTime;
    data['bak1'] = this.bak1;
    data['bak2'] = this.bak2;
    data['bak3'] = this.bak3;
    data['bak4'] = this.bak4;
    data['bak5'] = this.bak5;
    data['bak6'] = this.bak6;
    data['bak7'] = this.bak7;
    data['bak8'] = this.bak8;
    data['bak9'] = this.bak9;
    data['bak10'] = this.bak10;
    return data;
  }
}

