// model class to map the response from a list of dedicated virtual account
// in your integration

class ListDVAResponse{
  bool? status;
  String? message;
  List? data;
  ListDVAMeta? meta;
  ListDVAResponse({this.data,this.message,this.status, this.meta});

  factory ListDVAResponse.fromJson(Map<dynamic, dynamic> json){
    return ListDVAResponse(
        status: json['status'],
        message: json['message'],
        data: json['data']??[],

    );
  }
}

class ListDVAMeta {
  int? total,skipped,perPage, page,pageCount;
  ListDVAMeta({
    this.page,this.pageCount,this.perPage,this.skipped,this.total
});
}

class ListDVAData {
  ListDVABankData? bank;
  String? accountName, currency,accountNumber,createdAt,updatedAt;
  bool? assigned, active;
  int? dVAid;
  ListDVASplitConfigurationData? splitConfiguration;
  ListDVACustomerData? customer;

  ListDVAData({this.updatedAt,this.customer,this.currency,this.createdAt,
  this.bank,this.assigned,this.active,this.accountNumber,this.accountName,
  this.dVAid,this.splitConfiguration
  });

  factory ListDVAData.fromJson(Map<dynamic,dynamic> json){
    return ListDVAData(
        bank:ListDVABankData(
          name:json['bank']['bank'],
          id:json['bank']['id'],
          slug:json['bank']['slug'],
        ),
        accountName:json['account_name'],
        currency:json['currency'],
        accountNumber:json['account_number'],
        createdAt:json['created_at'],
        updatedAt:json['updated_at'],
        assigned:json['assigned'],
        active:json['active'],
        dVAid:json['id'],
        customer: ListDVACustomerData(
          customerId:json['customer']['id'],
          firstName:json['customer']['first_name'],
          lastName:json['customer']['last_name'],
          email:json['customer']['email'],
          customerCode:json['customer']['customer_code'],
          phone:json['customer']['phone'],
          riskAction:json['customer']['risk_action'],
          internationFormatPhone:json['customer']['international_format_phone'],
        ),
        splitConfiguration: ListDVASplitConfigurationData(
            subAccount: json['split_config']['subaccount']
        )
    );
  }
}

class ListDVABankData {
  String? name;
  int? id;
  String? slug;

  ListDVABankData({this.id,this.name,this.slug});
}

class ListDVACustomerData {
  int? customerId;
  String? firstName, lastName,email,customerCode, phone, riskAction;
  dynamic internationFormatPhone;

  ListDVACustomerData({this.customerCode,this.email,this.firstName, this.customerId,this.lastName,
    this.phone,this.riskAction, this.internationFormatPhone
  });
}

class ListDVASplitConfigurationData {
  String? subAccount;
  ListDVASplitConfigurationData({
    this.subAccount
});
}