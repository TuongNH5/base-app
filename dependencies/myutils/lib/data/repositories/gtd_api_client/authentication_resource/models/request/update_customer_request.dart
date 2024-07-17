class UpdateCustomerRequest {
  int? id;
  int? defaultTravellerId;
  String? customerClass;
  String? loginUsername;
  String? taxCompanyName;
  String? createdDate;
  String? updatedDate;
  int? loginId;
  String? branchCode;
  String? orgCode;
  String? taxAddress1;
  String? customerCode;
  String? taxNumber;
  String? status;

  UpdateCustomerRequest(
      {this.id,
        this.defaultTravellerId,
        this.customerClass,
        this.loginUsername,
        this.taxCompanyName,
        this.createdDate,
        this.updatedDate,
        this.loginId,
        this.branchCode,
        this.orgCode,
        this.taxAddress1,
        this.customerCode,
        this.taxNumber,
        this.status});

  UpdateCustomerRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    defaultTravellerId = json['defaultTravellerId'];
    customerClass = json['customerClass'];
    loginUsername = json['loginUsername'];
    taxCompanyName = json['taxCompanyName'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    loginId = json['loginId'];
    branchCode = json['branchCode'];
    orgCode = json['orgCode'];
    taxAddress1 = json['taxAddress1'];
    customerCode = json['customerCode'];
    taxNumber = json['taxNumber'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['defaultTravellerId'] = defaultTravellerId;
    data['customerClass'] = customerClass;
    data['loginUsername'] = loginUsername;
    data['taxCompanyName'] = taxCompanyName;
    data['createdDate'] = createdDate;
    data['updatedDate'] = updatedDate;
    data['loginId'] = loginId;
    data['branchCode'] = branchCode;
    data['orgCode'] = orgCode;
    data['taxAddress1'] = taxAddress1;
    data['customerCode'] = customerCode;
    data['taxNumber'] = taxNumber;
    data['status'] = status;
    return data;
  }
}
