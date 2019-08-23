class ActivityModel {
  int code;
  String msg;
  ActivityData data;

  ActivityModel({this.code, this.msg, this.data});

  ActivityModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new ActivityData.fromJson(json['data']) : null;
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

class ActivityData {
  ActivityPageInfo pageInfo;

  ActivityData({this.pageInfo});

  ActivityData.fromJson(Map<String, dynamic> json) {
    pageInfo = json['pageInfo'] != null
        ? new ActivityPageInfo.fromJson(json['pageInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pageInfo != null) {
      data['pageInfo'] = this.pageInfo.toJson();
    }
    return data;
  }
}

class ActivityPageInfo {
  int pageNum;
  int pageSize;
  int size;
  int startRow;
  int endRow;
  int total;
  int pages;
  List<ActivityList> list;
  int prePage;
  int nextPage;
  bool isFirstPage;
  bool isLastPage;
  bool hasPreviousPage;
  bool hasNextPage;
  int navigatePages;
  List<int> navigatepageNums;
  int navigateFirstPage;
  int navigateLastPage;
  int firstPage;
  int lastPage;

  ActivityPageInfo(
      {this.pageNum,
      this.pageSize,
      this.size,
      this.startRow,
      this.endRow,
      this.total,
      this.pages,
      this.list,
      this.prePage,
      this.nextPage,
      this.isFirstPage,
      this.isLastPage,
      this.hasPreviousPage,
      this.hasNextPage,
      this.navigatePages,
      this.navigatepageNums,
      this.navigateFirstPage,
      this.navigateLastPage,
      this.firstPage,
      this.lastPage});

  ActivityPageInfo.fromJson(Map<String, dynamic> json) {
    pageNum = json['pageNum'];
    pageSize = json['pageSize'];
    size = json['size'];
    startRow = json['startRow'];
    endRow = json['endRow'];
    total = json['total'];
    pages = json['pages'];
    if (json['list'] != null) {
      list = new List<ActivityList>();
      json['list'].forEach((v) {
        list.add(new ActivityList.fromJson(v));
      });
    }
    prePage = json['prePage'];
    nextPage = json['nextPage'];
    isFirstPage = json['isFirstPage'];
    isLastPage = json['isLastPage'];
    hasPreviousPage = json['hasPreviousPage'];
    hasNextPage = json['hasNextPage'];
    navigatePages = json['navigatePages'];
    navigatepageNums = json['navigatepageNums'].cast<int>();
    navigateFirstPage = json['navigateFirstPage'];
    navigateLastPage = json['navigateLastPage'];
    firstPage = json['firstPage'];
    lastPage = json['lastPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageNum'] = this.pageNum;
    data['pageSize'] = this.pageSize;
    data['size'] = this.size;
    data['startRow'] = this.startRow;
    data['endRow'] = this.endRow;
    data['total'] = this.total;
    data['pages'] = this.pages;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    data['prePage'] = this.prePage;
    data['nextPage'] = this.nextPage;
    data['isFirstPage'] = this.isFirstPage;
    data['isLastPage'] = this.isLastPage;
    data['hasPreviousPage'] = this.hasPreviousPage;
    data['hasNextPage'] = this.hasNextPage;
    data['navigatePages'] = this.navigatePages;
    data['navigatepageNums'] = this.navigatepageNums;
    data['navigateFirstPage'] = this.navigateFirstPage;
    data['navigateLastPage'] = this.navigateLastPage;
    data['firstPage'] = this.firstPage;
    data['lastPage'] = this.lastPage;
    return data;
  }
}

class ActivityList {
  String id;
  String name;
  String signStartTime;
  String signStopTime;
  String activityStartTime;
  String activityStopTime;
  String organizersName;
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

  ActivityList(
      {this.id,
      this.name,
      this.signStartTime,
      this.signStopTime,
      this.activityStartTime,
      this.activityStopTime,
      this.organizersName,
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

  ActivityList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    signStartTime = json['signStartTime'];
    signStopTime = json['signStopTime'];
    activityStartTime = json['activityStartTime'];
    activityStopTime = json['activityStopTime'];
    organizersName = json['organizersName'];
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

