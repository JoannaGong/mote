class ModelListModel {
  int code;
  String msg;
  ModelData data;

  ModelListModel({this.code, this.msg, this.data});

  ModelListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new ModelData.fromJson(json['data']) : null;
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

class ModelData {
  PageInfo pageInfo;

  ModelData({this.pageInfo});

  ModelData.fromJson(Map<String, dynamic> json) {
    pageInfo = json['pageInfo'] != null
        ? new PageInfo.fromJson(json['pageInfo'])
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

class PageInfo {
  int pageNum;
  int pageSize;
  int size;
  int startRow;
  int endRow;
  int total;
  int pages;
  List<ModelList> list;
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

  PageInfo(
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

  PageInfo.fromJson(Map<String, dynamic> json) {
    pageNum = json['pageNum'];
    pageSize = json['pageSize'];
    size = json['size'];
    startRow = json['startRow'];
    endRow = json['endRow'];
    total = json['total'];
    pages = json['pages'];
    if (json['list'] != null) {
      list = new List<ModelList>();
      json['list'].forEach((v) {
        list.add(new ModelList.fromJson(v));
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

class ModelList {
  String id;
  int roleName;
  Null permissionsId;
  String userName;
  String name;
  String headUrl;
  Null professional;
  Null email;
  Null phone;
  Null password;
  Null token;
  Null freshToken;
  int canLogin;
  Null areaId;
  int wechatAuthFlag;
  Null wechatAccessToken;
  Null wechatRefreshToken;
  int qqAuthFlag;
  Null qqAccessToken;
  Null qqRefreshToken;
  int weiboAuthFlag;
  Null weiboAccessToken;
  Null weiboRefreshToken;
  int alipayAuthFlag;
  Null alipayAccessToken;
  Null alipayRefreshToken;
  int recommendedFlag;
  Null height;
  Null weight;
  Null waistCircumference;
  Null theChest;
  Null hipCircumference;
  Null eyesColor;
  Null hairColor;
  Null skinColor;
  double walletBalance;
  int certificationType;
  int certificationSonType;
  Null certificationName;
  Null certificationIdcard;
  int certificationSex;
  Null certificationOrganizationCode;
  Null certificationHandheldIdcardPositive;
  Null certificationIdcardPositive;
  Null certificationIdcardBack;
  Null certificationBusinessLicense;
  int certificationCheckStatus;
  Null certificationCheckOption;
  Null certificationCheckUserId;
  Null createdUser;
  String createdTime;
  Null updatedUser;
  Null updatedTime;
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
  Null oldPassword;
  Null queryRoleName;
  Null queryCertificationSonType;
  Null queryString;
  Null phoneCode;
  Null userLableList;
  Null permissionRoleList;

  ModelList(
      {this.id,
      this.roleName,
      this.permissionsId,
      this.userName,
      this.name,
      this.headUrl,
      this.professional,
      this.email,
      this.phone,
      this.password,
      this.token,
      this.freshToken,
      this.canLogin,
      this.areaId,
      this.wechatAuthFlag,
      this.wechatAccessToken,
      this.wechatRefreshToken,
      this.qqAuthFlag,
      this.qqAccessToken,
      this.qqRefreshToken,
      this.weiboAuthFlag,
      this.weiboAccessToken,
      this.weiboRefreshToken,
      this.alipayAuthFlag,
      this.alipayAccessToken,
      this.alipayRefreshToken,
      this.recommendedFlag,
      this.height,
      this.weight,
      this.waistCircumference,
      this.theChest,
      this.hipCircumference,
      this.eyesColor,
      this.hairColor,
      this.skinColor,
      this.walletBalance,
      this.certificationType,
      this.certificationSonType,
      this.certificationName,
      this.certificationIdcard,
      this.certificationSex,
      this.certificationOrganizationCode,
      this.certificationHandheldIdcardPositive,
      this.certificationIdcardPositive,
      this.certificationIdcardBack,
      this.certificationBusinessLicense,
      this.certificationCheckStatus,
      this.certificationCheckOption,
      this.certificationCheckUserId,
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
      this.oldPassword,
      this.queryRoleName,
      this.queryCertificationSonType,
      this.queryString,
      this.phoneCode,
      this.userLableList,
      this.permissionRoleList});

  ModelList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleName = json['roleName'];
    permissionsId = json['permissionsId'];
    userName = json['userName'];
    name = json['name'];
    headUrl = json['headUrl'];
    professional = json['professional'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    token = json['token'];
    freshToken = json['freshToken'];
    canLogin = json['canLogin'];
    areaId = json['areaId'];
    wechatAuthFlag = json['wechatAuthFlag'];
    wechatAccessToken = json['wechatAccessToken'];
    wechatRefreshToken = json['wechatRefreshToken'];
    qqAuthFlag = json['qqAuthFlag'];
    qqAccessToken = json['qqAccessToken'];
    qqRefreshToken = json['qqRefreshToken'];
    weiboAuthFlag = json['weiboAuthFlag'];
    weiboAccessToken = json['weiboAccessToken'];
    weiboRefreshToken = json['weiboRefreshToken'];
    alipayAuthFlag = json['alipayAuthFlag'];
    alipayAccessToken = json['alipayAccessToken'];
    alipayRefreshToken = json['alipayRefreshToken'];
    recommendedFlag = json['recommendedFlag'];
    height = json['height'];
    weight = json['weight'];
    waistCircumference = json['waistCircumference'];
    theChest = json['theChest'];
    hipCircumference = json['hipCircumference'];
    eyesColor = json['eyesColor'];
    hairColor = json['hairColor'];
    skinColor = json['skinColor'];
    walletBalance = json['walletBalance'];
    certificationType = json['certificationType'];
    certificationSonType = json['certificationSonType'];
    certificationName = json['certificationName'];
    certificationIdcard = json['certificationIdcard'];
    certificationSex = json['certificationSex'];
    certificationOrganizationCode = json['certificationOrganizationCode'];
    certificationHandheldIdcardPositive =
        json['certificationHandheldIdcardPositive'];
    certificationIdcardPositive = json['certificationIdcardPositive'];
    certificationIdcardBack = json['certificationIdcardBack'];
    certificationBusinessLicense = json['certificationBusinessLicense'];
    certificationCheckStatus = json['certificationCheckStatus'];
    certificationCheckOption = json['certificationCheckOption'];
    certificationCheckUserId = json['certificationCheckUserId'];
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
    oldPassword = json['oldPassword'];
    queryRoleName = json['queryRoleName'];
    queryCertificationSonType = json['queryCertificationSonType'];
    queryString = json['queryString'];
    phoneCode = json['phoneCode'];
    userLableList = json['userLableList'];
    permissionRoleList = json['permissionRoleList'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['roleName'] = this.roleName;
    data['permissionsId'] = this.permissionsId;
    data['userName'] = this.userName;
    data['name'] = this.name;
    data['headUrl'] = this.headUrl;
    data['professional'] = this.professional;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['token'] = this.token;
    data['freshToken'] = this.freshToken;
    data['canLogin'] = this.canLogin;
    data['areaId'] = this.areaId;
    data['wechatAuthFlag'] = this.wechatAuthFlag;
    data['wechatAccessToken'] = this.wechatAccessToken;
    data['wechatRefreshToken'] = this.wechatRefreshToken;
    data['qqAuthFlag'] = this.qqAuthFlag;
    data['qqAccessToken'] = this.qqAccessToken;
    data['qqRefreshToken'] = this.qqRefreshToken;
    data['weiboAuthFlag'] = this.weiboAuthFlag;
    data['weiboAccessToken'] = this.weiboAccessToken;
    data['weiboRefreshToken'] = this.weiboRefreshToken;
    data['alipayAuthFlag'] = this.alipayAuthFlag;
    data['alipayAccessToken'] = this.alipayAccessToken;
    data['alipayRefreshToken'] = this.alipayRefreshToken;
    data['recommendedFlag'] = this.recommendedFlag;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['waistCircumference'] = this.waistCircumference;
    data['theChest'] = this.theChest;
    data['hipCircumference'] = this.hipCircumference;
    data['eyesColor'] = this.eyesColor;
    data['hairColor'] = this.hairColor;
    data['skinColor'] = this.skinColor;
    data['walletBalance'] = this.walletBalance;
    data['certificationType'] = this.certificationType;
    data['certificationSonType'] = this.certificationSonType;
    data['certificationName'] = this.certificationName;
    data['certificationIdcard'] = this.certificationIdcard;
    data['certificationSex'] = this.certificationSex;
    data['certificationOrganizationCode'] = this.certificationOrganizationCode;
    data['certificationHandheldIdcardPositive'] =
        this.certificationHandheldIdcardPositive;
    data['certificationIdcardPositive'] = this.certificationIdcardPositive;
    data['certificationIdcardBack'] = this.certificationIdcardBack;
    data['certificationBusinessLicense'] = this.certificationBusinessLicense;
    data['certificationCheckStatus'] = this.certificationCheckStatus;
    data['certificationCheckOption'] = this.certificationCheckOption;
    data['certificationCheckUserId'] = this.certificationCheckUserId;
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
    data['oldPassword'] = this.oldPassword;
    data['queryRoleName'] = this.queryRoleName;
    data['queryCertificationSonType'] = this.queryCertificationSonType;
    data['queryString'] = this.queryString;
    data['phoneCode'] = this.phoneCode;
    data['userLableList'] = this.userLableList;
    data['permissionRoleList'] = this.permissionRoleList;
    return data;
  }
}

