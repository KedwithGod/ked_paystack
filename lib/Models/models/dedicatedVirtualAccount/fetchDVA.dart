// a model class to refactor the response from fetch 
// a dedicated virtual account on your integration

class FetchDVAResponse{
  bool? status;
  String? message;
  FetchDVAData? data;
  FetchDVAResponse({this.status,this.message,this.data});

  factory FetchDVAResponse.fromJson(Map json){
    return FetchDVAResponse(
      status: json['status'],
      message: json['message'],
      data: FetchDVAData(
          transactions:json['data']['transactions'],
          subscription:json['data']['subscriptions'],
          authorization:json['data']['authorizations'],
          totalTransactionValue:json['data']['total_transaction_value'],
          firstName:json['data']['first_name'],
          lastName:json['data']['last_name'],
          phone:json['data']['phone'],
          email:json['data']['email'],
          domain:json['data']['domain'],
          customerCode:json['data']['customer_code'],
          createdAt:json['data']['createdAt'],
          updatedAt:json['data']['updatedAt'],
          riskAction:json['data']['risk_action'],
          metaData:json['data']['metadata'],
          dVAid:json['data']['id'],
          integration:json['data']['integration'],
          totalTransactions:json['data']['total_transactions'],
          dedicatedAccount: FetchDVADedicatedAccountData(
              dVADAid:json['data']['dedicated_account']['id'],
              accountName:json['data']['dedicated_account']['account_name'],
              accountNumber:json['data']['dedicated_account']['account_number'],
              createAt:json['data']['dedicated_account']['created_at'],
              updatedAt:json['data']['dedicated_account']['updated_at'],
              currency:json['data']['dedicated_account']['currency'],
              active:json['data']['dedicated_account']['active'],
              assigned:json['data']['dedicated_account']['assigned'],
              provider: FetchDVADAProvider(
                  providerId:json['data']['dedicated_account']['id'],
                  bankId:json['data']['dedicated_account']['bank_id'],
                  providerSlug:json['data']['dedicated_account']['provider_slug'],
                  bankName:json['data']['dedicated_account']['bank_name'],
              ),
            assignment: FetchDVADAAssignment(
                assignedId:json['data']['dedicated_account']['assignee_id'],
                integration:json['data']['dedicated_account']['integration'],
                assigneeType:json['data']['dedicated_account']['assignee_type'],
                accountType:json['data']['dedicated_account']['account_type'],
            )

          )

        ,
      )
    );
  }
}

class FetchDVAData {
  // most of these list has been serialized in other classes
  List? transactions,subscription,authorization, totalTransactionValue;
  String? firstName, lastName, phone, email, domain, customerCode,
  createdAt,updatedAt,riskAction;
  Map? metaData;
  int? dVAid,integration,totalTransactions;
  FetchDVADedicatedAccountData? dedicatedAccount;

  FetchDVAData({
    this.dVAid,this.createdAt,this.lastName,this.firstName,this.phone,
    this.customerCode,this.riskAction,this.email,this.integration,
    this.authorization,this.dedicatedAccount,this.domain,this.metaData,
    this.subscription,this.totalTransactions,this.totalTransactionValue,
    this.transactions,this.updatedAt
});
}

class FetchDVADedicatedAccountData {
  int? dVADAid; // dedicated virtual account dedicated account id
  String? accountName,accountNumber,
  createAt,updatedAt,currency;
  bool? active, assigned;
  FetchDVADAProvider? provider;
  FetchDVADAAssignment? assignment;

  FetchDVADedicatedAccountData({
    this.dVADAid,
    this.accountName,
    this.accountNumber,
    this.createAt,
    this.updatedAt,
    this.currency,
    this.active,
    this.assigned,
    this.provider,
    this.assignment
});
}

class FetchDVADAAssignment {
  int? assignedId, integration;
  String? assigneeType, accountType;

  FetchDVADAAssignment({
    this.assignedId,
    this.integration,
    this.assigneeType,
    this.accountType
});
}

class FetchDVADAProvider {
  int? providerId,bankId;
  String? providerSlug,bankName;

  FetchDVADAProvider({
    this.providerId,
    this.bankId,
    this.providerSlug,
    this.bankName
});

}


/// sample response Map
/// {
//   "status": true,
//   "message": "Customer retrieved",
//   "data": {
//     "transactions": [],
//     "subscriptions": [],
//     "authorizations": [],
//     "first_name": null,
//     "last_name": null,
//     "email": "rhode@chu.com",
//     "phone": null,
//     "metadata": null,
//     "domain": "live",
//     "customer_code": "CUS_h00a7ngn0xbzf2g",
//     "risk_action": "default",
//     "id": 17593,

//     "integration": 190972,
//     "createdAt": "2019-10-25T15:05:23.000Z",
//     "updatedAt": "2019-10-25T15:05:23.000Z",
//     "created_at": "2019-10-25T15:05:23.000Z",
//     "updated_at": "2019-10-25T15:05:23.000Z",
//     "total_transactions": 0,
//     "total_transaction_value": [],
//     "dedicated_account": {
//       "id": 59,
//       "account_name": "KAROKART/RHODA CHURCH",
//       "account_number": "9807062474",
//       "created_at": "2019-09-10T11:10:12.000Z",
//       "updated_at": "2019-10-25T15:05:24.000Z",
//       "currency": "NGN",
//       "active": true,
//       "assigned": true,
//       "provider": {
//         "id": 1,
//         "provider_slug": "wema-bank",
//         "bank_id": 20,
//         "bank_name": "Wema Bank"
//       },
//       "assignment": {
//         "assignee_id": 17593,
//         "assignee_type": "Customer",
//         "account_type": "PAY-WITH-TRANSFER-RECURRING",
//         "integration": 190972
//       }
//     }
//   }
// }