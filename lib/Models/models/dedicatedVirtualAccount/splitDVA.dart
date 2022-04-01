// modal class to serialize response splitDVA

class SplitDVAResponse{
  bool? status;
  String? message;
  SplitDVAData? data;

  SplitDVAResponse({this.status,this.message,this.data});

  factory SplitDVAResponse.fromJson(Map json){
    return SplitDVAResponse(
      status: json['status'],
      message: json['message'],
      data: SplitDVAData(
          accountName:json['data']['account_name'],
          currency:json['data']['currency'],
          accountNumber:json['data']['account_number'],
          createdAt:json['data']['created_at'],
          updatedAt:json['data']['updated_at'],
          assigned:json['data']['assigned'],
          active:json['data']['active'],
          metadata:json['data']['metadata'],
          dVAid:json['data']['id'],
        bank: SplitDVABankData(
            name:json['data']['bank']['name'],
            id:json['data']['bank']['id'],
            slug:json['data']['bank']['slug'],
        ),
        customer: SplitDVACustomerData(
            customerId:json['data']['customer']['id'],
            firstName:json['data']['customer']['first_name'],
            lastName:json['data']['customer']['last_name'],
            email:json['data']['customer']['email'],
            customerCode:json['data']['customer']['customer_code'],
            phone:json['data']['customer']['phone'],
            riskAction:json['data']['customer']['risk_action'],
            metadata:json['data']['customer']['metadata'],
        ),
        assignment: SplitDVAAssignmentData(
            integration:json['data']['assignment']['integration'],
            assigneeId:json['data']['assignment']['assignee_id'],
            assigneeType:json['data']['assignment']['assignee_type'],
            accountType:json['data']['assignment']['account_type'],
            assignedAt:json['data']['assignment']['assigned_at'],
            expired:json['data']['assignment']['expired'],
            expiredAt:json['data']['assignment']['expired_at'],
        ),
        splitConfiguration: SplitDVASplitConfigurationData(
          splitCode: json['data']['split_config']['split_code']
        )
      )
    );
  }
}

class SplitDVAData {
  SplitDVABankData? bank;
  String? accountName, currency,accountNumber,createdAt,updatedAt;
  bool? assigned, active;
  Map? metadata;
  int? dVAid;
  SplitDVAAssignmentData? assignment;
  SplitDVACustomerData? customer;
  SplitDVASplitConfigurationData? splitConfiguration;

  SplitDVAData({this.dVAid,this.accountName,this.accountNumber,this.active,this.assigned,
    this.assignment,this.bank,this.createdAt,this.currency,this.customer,this.metadata,
    this.updatedAt, this.splitConfiguration
  });
}

class SplitDVASplitConfigurationData {
  String? splitCode;
  SplitDVASplitConfigurationData({this.splitCode});
}

class SplitDVABankData {
  String? name;
  int? id;
  String? slug;

  SplitDVABankData({this.id,this.name,this.slug});
}

class SplitDVAAssignmentData {
  int? integration,assigneeId;
  String? assigneeType,accountType,assignedAt;
  bool? expired;
  dynamic expiredAt;

  SplitDVAAssignmentData({this.accountType,this.assignedAt,this.assigneeId,
    this.assigneeType, this.expired,this.integration, this.expiredAt
  });
}

class SplitDVACustomerData {
  int? customerId;
  String? firstName, lastName,email,customerCode, phone, riskAction;
  dynamic metadata;

  SplitDVACustomerData({this.customerCode,this.email,this.firstName, this.customerId,this.lastName,
    this.phone,this.riskAction, this.metadata
  });
}


/// sample response
/// {
//   "status": true,
//   "message": "Assigned Managed Account Successfully Created",
//   "data": {
//     "bank": {
//       "name": "Wema Bank",
//       "id": 20,
//       "slug": "wema-bank"
//     },
//     "account_name": "KAROKART/YINKA ADE",
//     "account_number": "6731105168",
//     "assigned": true,
//     "currency": "NGN",
//     "metadata": null,
//     "active": true,
//     "id": 97,
//     "created_at": "2019-11-13T13:52:39.000Z",
//     "updated_at": "2020-03-17T07:52:23.000Z",
//     "assignment": {
//       "integration": 100043,
//       "assignee_id": 17328,
//       "assignee_type": "Customer",
//       "expired": false,
//       "account_type": "PAY-WITH-TRANSFER-RECURRING",
//       "assigned_at": "2020-03-17T07:52:23.023Z",
//       "expired_at": null
//     },
//     "split_config": {"split_code":"SPL_e7jnRLtzla"},
//     "customer": {
//       "id": 17328,
//       "first_name": "YINKA",
//       "last_name": "ADE",
//       "email": "yinka@testemail.com",
//       "customer_code": "CUS_xxxxxxxx",
//       "phone": null,
//       "metadata": null,
//       "risk_action": "default"
//     }
//   }
// }
// Remove Split from Dedicated Account
// If you've previously set up split payment for transactions on a dedicated virtual account, you can remove it with this endpoint
// Headers
// authorization
// string
// Set value to Bearer SECRET_KEY
// content-type
// string
// Set value to application/json
// Body Param
// account_number
// string
// Dedicated virtual account number