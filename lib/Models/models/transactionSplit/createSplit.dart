// this is modal class to format the response from the create Split class

class CreateSplitResponse{
  bool? status;
  String? message;
  CreateSplitData? data;

  CreateSplitResponse({
    this.data,this.status,this.message
});

  factory CreateSplitResponse.fromJson(Map<dynamic, dynamic> json){
    return CreateSplitResponse(
      status: json['status'],
      message: json['status'],
      data: CreateSplitData(
          id:json['data']['id'],
          name:json['data']['name'],
          type:json['data']['type'],
          currency:json['data']['currency'],
          integration:json['data']['integration'],
          domain:json['data']['domain'],
          splitCode:json['data']['split_code'],
          active:json['data']['active'],
          bearerType:json['data']['bearer_type'],
          bearerSubAccount:json['data']['bearer_subaccount'],
          updatedAt:json['data']['updatedAt'],
          createdAt:json['data']['createdAt'],
          totalSubAccounts:json['data']['total_subaccounts'],
          subAccounts:json['data']['subaccounts'],
      )
    );
  }
}

class CreateSplitData {
  int? id;
  String? name;
  String? type;
  String? currency;
  int? integration;
  String? domain;
  String? splitCode;
  bool? active;
  String? bearerType;
  int? bearerSubAccount;
   String? updatedAt; // time in ISO8601 format
  // YYYY-MM-DD'T'hh:mm:ss.sTZD (e.g. 2015-12-11T20:28:30.45+01:00 or 2015-12-11T19:28:30.45Z)

  String? createdAt; // time in ISO8601 format
// YYYY-MM-DD'T'hh:mm:ss.sTZD (e.g. 2015-12-11T20:28:30.45+01:00 or 2015-12-11T19:28:30.45Z)
  int? totalSubAccounts;
  List<dynamic>? subAccounts;

  CreateSplitData({
    this.currency,this.active,this.bearerSubAccount,this.bearerType,this.createdAt,this.domain,this.id,
    this.integration,this.name, this.splitCode,this.subAccounts,this.totalSubAccounts,this.type,
    this.updatedAt
});
}

class SubAccountModel{
  int? id;
  String? subAccountCode;
  String? businessName;
  String? description;
  dynamic primaryContactEmail;
  dynamic primaryContactName;
  dynamic primaryContactPhone;
  dynamic metaData;
  int? percentageCharge;
  String? settlementBank;
  String? accountNumber;
  int? share;

  SubAccountModel({
    this.id,this.accountNumber,this.businessName,this.description,this.metaData,
    this.percentageCharge,this.primaryContactEmail,this.primaryContactName,
    this.primaryContactPhone, this.settlementBank, this.share,this.subAccountCode,
});

  factory SubAccountModel.fromJson(Map<dynamic,dynamic> json){
    return SubAccountModel(
      share: json['share'],
        id:json['subaccount']['id'],
        subAccountCode:json['subaccount']['subaccount_code'],
        businessName:json['subaccount']['business_name'],
        description:json['subaccount']['description'],
        primaryContactEmail:json['subaccount']['primary_contact_email'],
        primaryContactName:json['subaccount']['primary_contact_name'],
        primaryContactPhone:json['subaccount']['primary_contact_phone'],
        metaData:json['subaccount']['metadata'],
        percentageCharge:json['subaccount']['percentage_charge'],
        settlementBank:json['subaccount']['settlement_bank'],
        accountNumber:json['subaccount']['account_number'],
    );
  }
}






















///{
//   "status": true,
//   "message": "Split created",
//   "data": {
//     "id": 142,
//     "name": "Test Doc",
//     "type": "percentage",
//     "currency": "NGN",
//     "integration": 428626,
//     "domain": "test",
//     "split_code": "SPL_e7jnRLtzla",
//     "active": true,
//     "bearer_type": "subaccount",
//     "bearer_subaccount": 40809,
//     "createdAt": "2020-06-30T11:42:29.150Z",
//     "updatedAt": "2020-06-30T11:42:29.150Z",
//     "subaccounts": [
//       {
//         "subaccount": {
//           "id": 40809,
//           "subaccount_code": "ACCT_z3x6z3nbo14xsil",
//           "business_name": "Business Name",
//           "description": "Business Description",
//           "primary_contact_name": null,
//           "primary_contact_email": null,
//           "primary_contact_phone": null,
//           "metadata": null,
//           "percentage_charge": 20,
//           "settlement_bank": "Business Bank",
//           "account_number": "1234567890"
//         },
//         "share": 20
//       },
//       {
//         "subaccount": {
//           "id": 40809,
//           "subaccount_code": "ACCT_pwwualwty4nhq9d",
//           "business_name": "Business Name",
//           "description": "Business Description",
//           "primary_contact_name": null,
//           "primary_contact_email": null,
//           "primary_contact_phone": null,
//           "metadata": null,
//           "percentage_charge": 20,
//           "settlement_bank": "Business Bank",
//           "account_number": "0123456789"
//         },
//         "share": 30
//       }
//     ],
//     "total_subaccounts": 2
//   }
// }