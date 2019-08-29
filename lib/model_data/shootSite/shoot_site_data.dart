class ShootSiteModel {
  int code;
  String msg;
  ShootSiteData data;

  ShootSiteModel({this.code, this.msg, this.data});

  ShootSiteModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new ShootSiteData.fromJson(json['data']) : null;
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

class ShootSiteData {
  ShootSitePageInfo pageInfo;

  ShootSiteData({this.pageInfo});

  ShootSiteData.fromJson(Map<String, dynamic> json) {
    pageInfo = json['pageInfo'] != null
        ? new ShootSitePageInfo.fromJson(json['pageInfo'])
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

class ShootSitePageInfo {
  int pageNum;
  int pageSize;
  int size;
  int startRow;
  int endRow;
  int total;
  int pages;
  List<ShootSiteList> list;
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

  ShootSitePageInfo(
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

  ShootSitePageInfo.fromJson(Map<String, dynamic> json) {
    pageNum = json['pageNum'];
    pageSize = json['pageSize'];
    size = json['size'];
    startRow = json['startRow'];
    endRow = json['endRow'];
    total = json['total'];
    pages = json['pages'];
    if (json['list'] != null) {
      list = new List<ShootSiteList>();
      json['list'].forEach((v) {
        list.add(new ShootSiteList.fromJson(v));
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

class ShootSiteList {
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
  List<ShootingPlaceLableList> shootingPlaceLableList;
  Null queryString;

  ShootSiteList(
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

  ShootSiteList.fromJson(Map<String, dynamic> json) {
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
  ShootSiteLable lable;

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
    lable = json['lable'] != null ? new ShootSiteLable.fromJson(json['lable']) : null;
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

class ShootSiteLable {
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

  ShootSiteLable(
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

  ShootSiteLable.fromJson(Map<String, dynamic> json) {
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

