class ListSearchSplitResponse{

  bool? status;
  String? message;
  ListSearchSplitData? data;
  ListSearchSplitMeta? metaData;

  ListSearchSplitResponse({
    this.data,this.status,this.message
  });

  factory ListSearchSplitResponse.fromJson(Map<dynamic, dynamic> json){
    return ListSearchSplitResponse(
        status: json['status'],
        message: json['status'],
        data: ListSearchSplitData(
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

class ListSearchSplitMeta {
  int? total;
  int? skipped;
  int? perPage;
  int? page;
  dynamic pageCount;
  ListSearchSplitMeta({this.page,this.pageCount,this.perPage,this.skipped,this.total});
}

class ListSearchSplitData {
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

  ListSearchSplitData({
    this.currency,this.active,this.bearerSubAccount,this.bearerType,this.createdAt,this.domain,this.id,
    this.integration,this.name, this.splitCode,this.subAccounts,this.totalSubAccounts,this.type,
    this.updatedAt
  });
}


///{
//   "status": true,
//   "message": "Split retrieved",
//   "data": [
//     {
//       "id": 143,
//       "name": "Test Doc",
//       "split_code": "SPL_UO2vBzEqHW",
//       "integration": 428626,
//       "domain": "test",
//       "type": "percentage",
//       "active": 1,
//       "currency": "NGN",
//       "bearer_type": "subaccount",
//       "bearer_subaccount": 40809,
//       "created_at": "2020-06-30T11:52:24.000Z",
//       "updated_at": "2020-06-30T11:52:24.000Z",
//       "subaccounts": [
//         {
//           "subaccount": {
//             "id": 40809,
//             "subaccount_code": "ACCT_z3x6z3nbo14xsil",
//             "business_name": "Business Name",
//             "description": "Business Description",
//             "primary_contact_name": null,
//             "primary_contact_email": null,
//             "primary_contact_phone": null,
//             "metadata": null,
//             "percentage_charge": 80,
//             "settlement_bank": "Business Bank",
//             "account_number": "1234567890"
//           },
//           "share": 30
//         },
//         {
//           "subaccount": {
//             "id": 40811,
//             "subaccount_code": "ACCT_pwwualwty4nhq9d",
//             "business_name": "Business Name",
//             "description": "Business Description",
//             "primary_contact_name": null,
//             "primary_contact_email": null,
//             "primary_contact_phone": null,
//             "metadata": null,
//             "percentage_charge": 80,
//             "settlement_bank": "Business Bank",
//             "account_number": "0123456789"
//           },
//           "share": 20
//         }
//       ],
//       "total_subaccounts": 2
//     }
//   ],
//   "meta": {
//     "total": 1,
//     "skipped": 0,
//     "perPage": 50,
//     "page": 1,
//     "pageCount": 1
//   }
// }