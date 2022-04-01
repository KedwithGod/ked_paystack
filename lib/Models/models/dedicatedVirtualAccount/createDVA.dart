// a modal class to map the response of creating a dedicated virtual account

class CreateDVAResponse{
  bool? status;
  String? message;
  CreateDVAData? data;

  CreateDVAResponse({this.data,this.message,this.status});

  // create a fromJson class to map the data from json to map

  factory CreateDVAResponse.fromJson(Map<dynamic,dynamic> json){
    return CreateDVAResponse(
      status: json['status'],
      message: json['message'],
      data: CreateDVAData(
          bank:CreateDVABankData(
              name:json['data']['bank']['bank'],
              id:json['data']['bank']['id'],
              slug:json['data']['bank']['slug'],
          ),
          accountName:json['data']['account_name'],
          currency:json['data']['currency'],
          accountNumber:json['data']['account_number'],
          createdAt:json['data']['created_at'],
          updatedAt:json['data']['updated_at'],
          assigned:json['data']['assigned'],
          active:json['data']['active'],
          metadata:json['data']['metadata'],
          dVAid:json['data']['id'],
        assignment: CreateDVAAssignmentData(
            integration:json['data']['assignment']['integration'],
            assigneeId:json['data']['assignment']['assignee_id'],
            assigneeType:json['data']['assignment']['assignee_type'],
            accountType:json['data']['assignment']['account_type'],
            assignedAt:json['data']['assignment']['assigned_type'],
            expired:json['data']['assignment']['id'],
        ),
        customer: CreateDVACustomerData(
            customerId:json['data']['customer']['id'],
            firstName:json['data']['customer']['first_name'],
            lastName:json['data']['customer']['last_name'],
            email:json['data']['customer']['email'],
            customerCode:json['data']['customer']['customer_code'],
            phone:json['data']['customer']['phone'],
            riskAction:json['data']['customer']['risk_action'],
        )
      )
    );
  }
}

class CreateDVAData {
  CreateDVABankData? bank;
  String? accountName, currency,accountNumber,createdAt,updatedAt;
  bool? assigned, active;
  Map? metadata;
  int? dVAid;
  CreateDVAAssignmentData? assignment;
  CreateDVACustomerData? customer;

  CreateDVAData({this.dVAid,this.accountName,this.accountNumber,this.active,this.assigned,
  this.assignment,this.bank,this.createdAt,this.currency,this.customer,this.metadata,
    this.updatedAt
  });
}

class CreateDVACustomerData {
  int? customerId;
  String? firstName, lastName,email,customerCode, phone, riskAction;

  CreateDVACustomerData({this.customerCode,this.email,this.firstName, this.customerId,this.lastName,
  this.phone,this.riskAction
  });
}

class CreateDVAAssignmentData {
  int? integration,assigneeId;
  String? assigneeType,accountType,assignedAt;
  bool? expired;

  CreateDVAAssignmentData({this.accountType,this.assignedAt,this.assigneeId,
  this.assigneeType, this.expired,this.integration
  });
}

class CreateDVABankData {
  String? name;
  int? id;
  String? slug;

  CreateDVABankData({this.id,this.name,this.slug});
}



/* "status": true,
"message": "NUBAN successfully created",
"data": {
"bank": {
"name": "Wema Bank",
"id": 20,
"slug": "wema-bank"
},
"account_name": "KAROKART / RHODA CHURCH",
"account_number": "9930000737",
"assigned": true,
"currency": "NGN",
"metadata": null,
"active": true,
"id": 253,
"created_at": "2019-12-12T12:39:04.000Z",
"updated_at": "2020-01-06T15:51:24.000Z",
"assignment": {
"integration": 100043,
"assignee_id": 7454289,
"assignee_type": "Customer",
"expired": false,
"account_type": "PAY-WITH-TRANSFER-RECURRING",
"assigned_at": "2020-01-06T15:51:24.764Z"
},
"customer": {
"id": 7454289,
"first_name": "RHODA",
"last_name": "CHURCH",
"email": "rhodachurch@email.com",
"customer_code": "CUS_kpb3qj71u1m0rw8",
"phone": "+2349053267565",
"risk_action": "default"
}
}
}*/