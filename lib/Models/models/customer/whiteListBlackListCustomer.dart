// white list or black list a customer using risk action

class WhiteListBlackListCustomerResponse{
  bool? status;
  String? message;
  WhiteListBlackListCustomerData? data;

  WhiteListBlackListCustomerResponse({
    this.message,this.status,this.data
});

  factory WhiteListBlackListCustomerResponse.fromJson(Map json){
    return WhiteListBlackListCustomerResponse(
      status: json['status'],
      message: json['message'],
      data: WhiteListBlackListCustomerData(
        firstName: json['data']['first_name'],
          email: json['data']['email'],
          lastName: json['data']['last_name'],
          createdAt: json['data']['createdAt'],
          updatedAt: json['data']['updatedAt'],
          domain: json['data']['domain'],
          customerCode: json['data']['customer_code'],
          phone: json['data']['phone'],
          riskAction: json['data']['risk_action'],
          metaData: json['data']['metadata'],
          integration: json['data']['integration'],
          customerId: json['data']['id'],
          identified: json['data']['identified'],
          identifications: json['data']['identifications'],

      )
    );
  }
}

class WhiteListBlackListCustomerData {
  String? email, firstName, lastName, createdAt, updatedAt, domain, customerCode,
      phone, riskAction;
  Map? metaData;
  int? integration,customerId;
  bool? identified;
  List? identifications;

  WhiteListBlackListCustomerData({this.lastName,this.firstName,this.metaData,
    this.phone,this.identifications,this.customerId,this.customerCode,
    this.email,this.identified,this.domain,this.updatedAt,this.integration,
    this.createdAt,this.riskAction
  });
}