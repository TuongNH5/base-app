class CustomerProfileResponse {
  int? id;
  String? loginUsername;
  String? customerClass;
  int? defaultTravellerId;
  String? taxCompanyName;
  String? referencedBy;
  String? createdDate;
  String? updatedDate;
  int? loginId;
  String? branchCode;
  String? orgCode;
  String? customerCode;
  String? taxAddress1;
  String? taxAddress2;
  String? status;
  String? taxNumber;

  CustomerProfileResponse({
    this.id,
    this.loginUsername,
    this.customerClass,
    this.defaultTravellerId,
    this.taxCompanyName,
    this.referencedBy,
    this.createdDate,
    this.updatedDate,
    this.loginId,
    this.branchCode,
    this.orgCode,
    this.customerCode,
    this.taxAddress1,
    this.taxAddress2,
    this.status,
    this.taxNumber,
  });

  CustomerProfileResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    loginUsername = json['loginUsername'];
    customerClass = json['customerClass'];
    defaultTravellerId = json['defaultTravellerId'];
    taxCompanyName = json['taxCompanyName'];
    referencedBy = json['referencedBy'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    loginId = json['loginId'];
    branchCode = json['branchCode'];
    orgCode = json['orgCode'];
    customerCode = json['customerCode'];
    taxAddress1 = json['taxAddress1'];
    taxAddress2 = json['taxAddress2'];
    status = json['status'];
    taxNumber = json['taxNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['loginUsername'] = loginUsername;
    data['customerClass'] = customerClass;
    data['defaultTravellerId'] = defaultTravellerId;
    data['taxCompanyName'] = taxCompanyName;
    data['referencedBy'] = referencedBy;
    data['createdDate'] = createdDate;
    data['updatedDate'] = updatedDate;
    data['loginId'] = loginId;
    data['branchCode'] = branchCode;
    data['orgCode'] = orgCode;
    data['customerCode'] = customerCode;
    data['taxAddress1'] = taxAddress1;
    data['taxAddress2'] = taxAddress2;
    data['status'] = status;
    data['taxNumber'] = taxNumber;
    return data;
  }
}
