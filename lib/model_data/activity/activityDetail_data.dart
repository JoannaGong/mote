class ActivityDetailModel {
  int code;
  String msg;
  ActivityDetailData data;

  ActivityDetailModel({this.code, this.msg, this.data});

  ActivityDetailModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new ActivityDetailData.fromJson(json['data']) : null;
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

class ActivityDetailData {
  Activity activity;

  ActivityDetailData({this.activity});

  ActivityDetailData.fromJson(Map<String, dynamic> json) {
    activity = json['activity'] != null
        ? new Activity.fromJson(json['activity'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.activity != null) {
      data['activity'] = this.activity.toJson();
    }
    return data;
  }
}

class Activity {
  String id;
  String name;
  String signStartTime;
  String signStopTime;
  String activityStartTime;
  String activityStopTime;
  String organizersName;
  String address;
  double applicationPrice;
  String coverPicUrl;
  int status;
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
  String introduce;
  Null queryString;
  int activityGuestCount;

  Activity(
      {this.id,
      this.name,
      this.signStartTime,
      this.signStopTime,
      this.activityStartTime,
      this.activityStopTime,
      this.organizersName,
      this.address,
      this.applicationPrice,
      this.coverPicUrl,
      this.status,
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
      this.queryString,
      this.activityGuestCount});

  Activity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    signStartTime = json['signStartTime'];
    signStopTime = json['signStopTime'];
    activityStartTime = json['activityStartTime'];
    activityStopTime = json['activityStopTime'];
    organizersName = json['organizersName'];
    address = json['address'];
    applicationPrice = json['applicationPrice'];
    coverPicUrl = json['coverPicUrl'];
    status = json['status'];
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
    queryString = json['queryString'];
    activityGuestCount = json['activityGuestCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['signStartTime'] = this.signStartTime;
    data['signStopTime'] = this.signStopTime;
    data['activityStartTime'] = this.activityStartTime;
    data['activityStopTime'] = this.activityStopTime;
    data['organizersName'] = this.organizersName;
    data['address'] = this.address;
    data['applicationPrice'] = this.applicationPrice;
    data['coverPicUrl'] = this.coverPicUrl;
    data['status'] = this.status;
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
    data['queryString'] = this.queryString;
    data['activityGuestCount'] = this.activityGuestCount;
    return data;
  }
}

