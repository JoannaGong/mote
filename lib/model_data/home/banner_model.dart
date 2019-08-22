class BannerModel {
  int code;
  String msg;
  BannerData data;

  BannerModel({this.code, this.msg, this.data});

  BannerModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new BannerData.fromJson(json['data']) : null;
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

class BannerData {
  List<BannerList> bannerList;

  BannerData({this.bannerList});

  BannerData.fromJson(Map<String, dynamic> json) {
    if (json['bannerList'] != null) {
      bannerList = new List<BannerList>();
      json['bannerList'].forEach((v) {
        bannerList.add(new BannerList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bannerList != null) {
      data['bannerList'] = this.bannerList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BannerList {
  String id;
  String name;
  int roleName;
  String pageUrl;
  String iconUrl;
  String dataId;
  Null requestUrl;
  Null enableFlag;
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
  Null queryString;

  BannerList(
      {this.id,
      this.name,
      this.roleName,
      this.pageUrl,
      this.iconUrl,
      this.dataId,
      this.requestUrl,
      this.enableFlag,
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
      this.bak10,
      this.queryString});

  BannerList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    roleName = json['roleName'];
    pageUrl = json['pageUrl'];
    iconUrl = json['iconUrl'];
    dataId = json['dataId'];
    requestUrl = json['requestUrl'];
    enableFlag = json['enableFlag'];
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
    queryString = json['queryString'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['roleName'] = this.roleName;
    data['pageUrl'] = this.pageUrl;
    data['iconUrl'] = this.iconUrl;
    data['dataId'] = this.dataId;
    data['requestUrl'] = this.requestUrl;
    data['enableFlag'] = this.enableFlag;
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
    data['queryString'] = this.queryString;
    return data;
  }
}