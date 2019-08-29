class ShootSiteDetailModel {
  int code;
  String msg;
  ShootSiteDetailData data;

  ShootSiteDetailModel({this.code, this.msg, this.data});

  ShootSiteDetailModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new ShootSiteDetailData.fromJson(json['data']) : null;
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

class ShootSiteDetailData {
  ShootingPlace shootingPlace;

  ShootSiteDetailData({this.shootingPlace});

  ShootSiteDetailData.fromJson(Map<String, dynamic> json) {
    shootingPlace = json['shootingPlace'] != null
        ? new ShootingPlace.fromJson(json['shootingPlace'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shootingPlace != null) {
      data['shootingPlace'] = this.shootingPlace.toJson();
    }
    return data;
  }
}

class ShootingPlace {
  String id;
  String name;
  String recommendedFlug;
  String areaId;
  String address;
  double score;
  String coverPicUrl;
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
  String introduce;
  List<ShootingPlaceLableList> shootingPlaceLableList;
  Null queryString;

  ShootingPlace(
      {this.id,
      this.name,
      this.recommendedFlug,
      this.areaId,
      this.address,
      this.score,
      this.coverPicUrl,
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
      this.introduce,
      this.shootingPlaceLableList,
      this.queryString});

  ShootingPlace.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    recommendedFlug = json['recommendedFlug'];
    areaId = json['areaId'];
    address = json['address'];
    score = json['score'];
    coverPicUrl = json['coverPicUrl'];
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
    introduce = json['introduce'];
    if (json['shootingPlaceLableList'] != null) {
      shootingPlaceLableList = new List<ShootingPlaceLableList>();
      json['shootingPlaceLableList'].forEach((v) {
        shootingPlaceLableList.add(new ShootingPlaceLableList.fromJson(v));
      });
    }
    queryString = json['queryString'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['recommendedFlug'] = this.recommendedFlug;
    data['areaId'] = this.areaId;
    data['address'] = this.address;
    data['score'] = this.score;
    data['coverPicUrl'] = this.coverPicUrl;
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
    data['introduce'] = this.introduce;
    if (this.shootingPlaceLableList != null) {
      data['shootingPlaceLableList'] =
          this.shootingPlaceLableList.map((v) => v.toJson()).toList();
    }
    data['queryString'] = this.queryString;
    return data;
  }
}

class ShootingPlaceLableList {
  String id;
  String shootingPlaceId;
  String labelId;
  int labelType;
  String createdUser;
  String createdTime;
  String updatedUser;
  String updatedTime;
  int deleteStatus;
  String deleteTime;
  String bak1;
  String bak2;
  String bak3;
  String bak4;
  String bak5;
  String bak6;
  String bak7;
  String bak8;
  String bak9;
  String bak10;
  ShootSiteDetailLable lable;

  ShootingPlaceLableList(
      {this.id,
      this.shootingPlaceId,
      this.labelId,
      this.labelType,
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
      this.lable});

  ShootingPlaceLableList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shootingPlaceId = json['shootingPlaceId'];
    labelId = json['labelId'];
    labelType = json['labelType'];
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
    lable = json['lable'] != null ? new ShootSiteDetailLable.fromJson(json['lable']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shootingPlaceId'] = this.shootingPlaceId;
    data['labelId'] = this.labelId;
    data['labelType'] = this.labelType;
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
    if (this.lable != null) {
      data['lable'] = this.lable.toJson();
    }
    return data;
  }
}

class ShootSiteDetailLable {
  String id;
  int groupType;
  String name;
  int theCustomFlag;
  int type;
  String createdUser;
  String createdTime;
  String updatedUser;
  String updatedTime;
  int deleteStatus;
  String deleteTime;
  String bak1;
  String bak2;
  String bak3;
  String bak4;
  String bak5;
  String bak6;
  String bak7;
  String bak8;
  String bak9;
  String bak10;

  ShootSiteDetailLable(
      {this.id,
      this.groupType,
      this.name,
      this.theCustomFlag,
      this.type,
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

  ShootSiteDetailLable.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupType = json['groupType'];
    name = json['name'];
    theCustomFlag = json['theCustomFlag'];
    type = json['type'];
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
    data['groupType'] = this.groupType;
    data['name'] = this.name;
    data['theCustomFlag'] = this.theCustomFlag;
    data['type'] = this.type;
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

