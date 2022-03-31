// modal class to fetch a specific customer

class FetchCustomerResponse{
    bool? status;
    String? message;
    FetchCustomerData? data;
    FetchCustomerResponse({
      this.status, this.message,this.data
});

    factory FetchCustomerResponse.fromJson(Map json){
      return FetchCustomerResponse(
        status: json['status'],
        message: json['message'],
        data:FetchCustomerData(
          email: json['data']['email'],
            firstName: json['data']['first_name'],
            lastName: json['data']['last_name'],
            phone: json['data']['phone'],
            metaData: json['data']['metadata'],
            integration: json['data']['integration'],
            domain: json['data']['domain'],
            customerCode: json['data']['customer_code'],
            customerId: json['data']['id'],
            identified: json['data']['identified'],
            riskAction: json['data']['risk_action'],
            identifications: json['data']['identifications'],
            createdAt: json['data']['createdAt'],
            updatedAt: json['data']['updatedAt'],
            totalTransaction: json['data']['total_transaction'],
            totalTransactionValue: json['data']['totalTransaction'],
            dedicatedAccount: FetchCustomerDedicatedAccount(
                bank:FetchCustomerBank(
                  id: json['data']['dedicated_account']['bank']['id'],
                  name: json['data']['dedicated_account']['bank']['name'],
                  slug: json['data']['dedicated_account']['bank']['slug']
                ),
                id:json['data']['dedicated_account']['id'],
                accountName:json['data']['dedicated_account']['account_name'],
                accountNumber:json['data']['dedicated_account']['account_number'],
                createdAt:json['data']['dedicated_account']['created_at'],
                updateDatedAt:json['data']['dedicated_account']['updated_at'],
                currency:json['data']['dedicated_account']['currency'],
                active:json['data']['dedicated_account']['active'],
                assigned:json['data']['dedicated_account']['assigned'],
                assignment:FetchCustomerAssignment(
                  assignedId: json['data']['dedicated_account']['assignee_id'],
                    assignedType:json['data']['dedicated_account']['assignee_type'],
                    accountType:json['data']['dedicated_account']['account_type'],
                    integration:json['data']['dedicated_account']['integration'],
                ),
                splitConfiguration: FetchCustomerSplitConfiguration(
                    id:json['data']['dedicated_account']['split_config']['id'],
                    name:json['data']['dedicated_account']['split_config']['name'],
                    type:json['data']['dedicated_account']['split_config']['type'],
                    currency:json['data']['dedicated_account']['split_config']['currency'],
                    integration:json['data']['dedicated_account']['split_config']['integration'],
                    domain:json['data']['dedicated_account']['split_config']['domain'],
                    splitCode:json['data']['dedicated_account']['split_config']['split_code'],
                    active:json['data']['dedicated_account']['split_config']['active'],
                    bearerType:json['data']['dedicated_account']['split_config']['bearer_type'],
                    bearerSubAccount:json['data']['dedicated_account']['split_config']['bearer_subaccount'],
                    updatedAt:json['data']['dedicated_account']['split_config']['updatedAt'],
                    createdAt:json['data']['dedicated_account']['split_config']['createdAt'],
                    totalSubAccounts:json['data']['dedicated_account']['split_config']['total_subaccounts'],
                    subAccounts:json['data']['dedicated_account']['split_config']['subaccounts'],
                    isDynamic:json['data']['dedicated_account']['split_config']['is_dynamic'],
                )
            ),
            transactions: json['data']['transactions'],
            subscription: json['data']['subscriptions'],
            authorization: json['data']['authorizations'],
        )
      );
    }

}

class FetchCustomerData {
  String? email;
  String? firstName;
  String? lastName;
  String? phone;
  Map? metaData; // the reason i did not create a modal class for this is because,
  // the metaData is a map of extra data the developer want user to enter,
  // and what the map contains differ based on the application need
  // check the sample response at the end of this page
  int? integration;
  String? domain;
  String? customerCode;
  int? customerId;
  bool? identified;
  String? riskAction;
  List? identifications;
  String? createdAt;
  String? updatedAt;
  int? totalTransaction;
  List? totalTransactionValue;
  FetchCustomerDedicatedAccount? dedicatedAccount;
  List? transactions;
  List? subscription;
  List? authorization;
  FetchCustomerData({
    this.updatedAt,this.integration,this.domain,this.createdAt,this.customerId,
    this.customerCode,this.email,this.identifications,this.identified,
    this.metaData,this.phone,this.lastName,this.firstName,this.riskAction,
    this.authorization,this.dedicatedAccount,this.subscription,this.totalTransaction,
    this.totalTransactionValue,this.transactions
  });
}

// use this class to parse the value gotten from the identification
class FetchCustomerIdentification {
  String? country;
  String? type;
  String? value;

  FetchCustomerIdentification({this.type,this.country,this.value});
}

// use this class to parse the value output from the authorization
class FetchCustomerAuthorizationCode{
  String? authorizationCode;
  String? bin;
  String? last4CardDigit;
  String? expiryMonth;
  String? expiryYear;
  String? channel;
  String? cardType;
  String? bank;
  String? countryCode;
  String? brand;
  bool? reusable;
  String? signature;
  String? accountName;

  FetchCustomerAuthorizationCode({
    this.accountName,this.authorizationCode,this.bank,this.bin,this.brand,this.cardType,
    this.channel,this.countryCode,this.expiryMonth,this.expiryYear,this.last4CardDigit,this.reusable,
    this.signature
});
}

// this is parse the dedicated account details

class FetchCustomerDedicatedAccount{
  FetchCustomerBank? bank;
  int? id;
  String? accountName;
  String? accountNumber;
  String? createdAt;
  String? updateDatedAt;
  String? currency;
  bool? active;
  bool? assigned;
  FetchCustomerAssignment? assignment;
  FetchCustomerSplitConfiguration? splitConfiguration;

  FetchCustomerDedicatedAccount({this.assignment,this.accountNumber,this.id,this.currency
  ,this.active,this.createdAt,this.splitConfiguration,this.bank,this.accountName,
    this.assigned,this.updateDatedAt,
  });
}

class FetchCustomerAssignment {
  int? assignedId;
  String? assignedType;
  String? accountType;
  int? integration;

  FetchCustomerAssignment({
   this.integration,this.assignedId,
   this.accountType,this.assignedType
});
}

// the split configuration class under dedicated account
class FetchCustomerSplitConfiguration {
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
  bool? isDynamic;

  FetchCustomerSplitConfiguration({
    this.name,this.id,this.type,this.createdAt,this.domain,this.integration,
    this.updatedAt,this.bearerSubAccount,this.bearerType,this.totalSubAccounts,
    this.subAccounts,this.splitCode,this.active,this.currency,this.isDynamic
});
}

// this is to parse subAccount in dedicated account

class FetchCustomerSubAccount{
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

  FetchCustomerSubAccount({this.id,this.metaData,this.share,this.subAccountCode,this.settlementBank,
  this.primaryContactPhone,this.primaryContactName,this.primaryContactEmail,this.percentageCharge,
  this.description,this.businessName,this.accountNumber
  });
}

// this is to parse the bank under dedicated account

class FetchCustomerBank{
  String? name;
  int? id;
  String? slug;

  FetchCustomerBank({this.id,this.name,this.slug});
}


/// sample response
/// {
//   "status": true,
//   "message": "Customer retrieved",
//   "data": {
//     "integration": 100032,
//     "first_name": "Bojack",
//     "last_name": "Horseman",
//     "email": "bojack@horsinaround.com",
//     "phone": null,
//     "dedicated_account": {
//       "bank": {
//           "name": "Wema Bank",
//           "id": 20,
//           "slug": "wema-bank"
//       },
//       "id": 92747,
//       "account_name": "PAYSTACKPAYME/ADEWUYI OLUGBENGA",
//       "account_number": "7358520019",
//       "created_at": "2021-02-09T09:13:49.000Z",
//       "updated_at": "2021-02-09T09:13:49.000Z",
//       "currency": "NGN",
//       "split_config": {
//           "id": 221,
//           "name": "My Split",
//           "type": "flat",
//           "currency": "NGN",
//           "integration": 100043,
//           "domain": "live",
//           "split_code": "SPL_goizzoc1rgizm53",
//           "active": true,
//           "bearer_type": "all",
//           "bearer_subaccount": null,
//           "createdAt": "2020-08-13T14:52:49.000Z",
//           "updatedAt": "2020-08-13T14:52:49.000Z",
//           "is_dynamic": true,
//           "subaccounts": [
//               {
//                   "subaccount": {
//                       "id": 246,
//                       "subaccount_code": "ACCT_lf61e3lk2dqqlg1",
//                       "business_name": "Bami FB",
//                       "description": "Bami FB",
//                       "primary_contact_name": null,
//                       "primary_contact_email": null,
//                       "primary_contact_phone": null,
//                       "metadata": null,
//                       "settlement_bank": "First Bank of Nigeria",
//                       "currency": "NGN",
//                       "account_number": "3055740701"
//                   },
//                   "share": 20000
//               }
//           ],
//           "total_subaccounts": 1
//       },
//       "active": true,
//       "assigned": true,
//       "assignment": {
//           "assignee_id": 973,
//           "assignee_type": "Customer",
//           "account_type": "PAY-WITH-TRANSFER-RECURRING",
//           "integration": 100043
//       }
//   },
//   "identified": true,
//   "identifications": [
//       {
//           "country": "NG",
//           "type": "bvn",
//           "value": "223*****992"
//       }
//   ],
//     "metadata": {
//       "photos": [
//         {
//           "type": "twitter",
//           "typeId": "twitter",
//           "typeName": "Twitter",
//           "url": "https://d2ojpxxtu63wzl.cloudfront.net/static/61b1a0a1d4dda2c9fe9e165fed07f812_a722ae7148870cc2e33465d1807dfdc6efca33ad2c4e1f8943a79eead3c21311",
//           "isPrimary": true
//         }
//       ]
//     "domain": "test",
//     "customer_code": "CUS_xnxdt6s1zg1f4nx",
//     "id": 1173,
//     "transactions": [],
//     "subscriptions": [],
//     "authorizations": [],
//     "createdAt": "2016-03-29T20:03:09.000Z",
//     "updatedAt": "2016-03-29T20:03:10.000Z"
//   }
// }