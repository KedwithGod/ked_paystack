// a model class for the response when customer details is update

class UpdateCustomerResponse{
  bool? status;
  String? message;
  UpdateCustomerData? data;

  UpdateCustomerResponse({
    this.data,this.message,this.status
  });

  factory UpdateCustomerResponse.fromJson(Map json){
    return UpdateCustomerResponse(
      status: json['status'],
      message: json['message'],
      data: UpdateCustomerData(
        email: json['data']['email'],
          firstName: json['data']['first_name'],
          lastName: json['data']['last_name'],
          createdAt: json['data']['createdAt'],
          updatedAt: json['data']['updatedAt'],
          domain: json['data']['domain'],
          customerCode: json['data']['customer_code'],
          phone: json['data']['phone'],
          metaData: json['data']['metadata'],
          integration: json['data']['integration'],
          identified: json['data']['identified'],
          identifications: json['data']['identifications'],
          transactions: json['data']['transactions'],
          subscription: json['data']['subscriptions'],
          authorization: json['data']['authorization'],
      )
    );
  }
}

class UpdateCustomerData {
  String? email, firstName, lastName, createdAt, updatedAt, domain, customerCode,
   phone;
  Map? metaData;
  int? integration,customerId;
  bool? identified;
  List? identifications, transactions, subscription, authorization;
  UpdateCustomerData({
    this.createdAt, this.transactions,this.subscription,this.authorization,
    this.integration,this.metaData,this.updatedAt,this.domain, this.firstName,
    this.lastName, this.phone,this.identified, this.email,this.customerCode,
    this.customerId,this.identifications
});
}