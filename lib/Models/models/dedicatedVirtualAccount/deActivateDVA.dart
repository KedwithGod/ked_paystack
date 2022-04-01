// a model class to serialize response from deActivateDVA class function

class DeActiveDVAResponse{
  bool? status;
  String? message;
  DeActiveDVAData? data;

  DeActiveDVAResponse({this.data,this.message,this.status});

  factory DeActiveDVAResponse.fromJson(Map json){
    return DeActiveDVAResponse(
      status: json['status'],
      message: json['message'],
      data: DeActiveDVAData(
          accountName:json['data']['account_name'],
          accountNumber:json['data']['account_number'],
          currency:json['data']['currency'],
          createdAt:json['data']['created_at'],
          updatedAt:json['data']['updated_at'],
          assigned:json['data']['assigned'],
          active:json['data']['active'],
          metadata:json['data']['metadata'],
          id:json['data']['id'],
          bank: DeActiveDVABankData(
              name:json['data']['bank']['name'],
              id:json['data']['bank']['id'],
              slug:json['data']['bank']['slug'],
          ),
          assignment:DeActiveDVAAssignmentData(
              integration:json['data']['assignment']['integration'],
              assigneeId:json['data']['assignment']['assignee_id'],
              assigneeType:json['data']['assignment']['assignee_type'],
              accountType:json['data']['assignment']['account_type'],
              assignedAt:json['data']['assignment']['assigned_at'],
          )
      )
    );
  }
}

class DeActiveDVAData {
  String? accountName, accountNumber,currency,createdAt,updatedAt;
    bool? assigned,active;
    Map? metadata;
    int? id;
  DeActiveDVABankData? bank;
  DeActiveDVAAssignmentData? assignment;

  DeActiveDVAData({
    this.accountName,
    this.accountNumber,
    this.currency,
    this.createdAt,
    this.updatedAt,
    this.assigned,
    this.active,
    this.metadata,
    this.id,
    this.bank,
    this.assignment,
});

}

class DeActiveDVABankData {
  String? name;
  int? id;
  String? slug;

  DeActiveDVABankData({this.id,this.name,this.slug});
}

class DeActiveDVAAssignmentData {
  int? integration,assigneeId;
  String? assigneeType,accountType,assignedAt;


  DeActiveDVAAssignmentData({this.accountType,this.assignedAt,this.assigneeId,
    this.assigneeType,this.integration
  });
}

/// sample response
/// {
//   "status": true,
//   "message": "Managed Account Successfully Unassigned",
//   "data": {
//     "bank": {
//       "name": "Wema Bank",
//       "id": 20,
//       "slug": "wema-bank"
//     },
//     "account_name": "KAROKART/A YINKA",
//     "account_number": "9930020212",
//     "assigned": false,
//     "currency": "NGN",
//     "metadata": null,
//     "active": true,

//     "id": 173,
//     "created_at": "2019-12-09T13:31:38.000Z",
//     "updated_at": "2020-08-28T10:04:25.000Z",
//     "assignment": {
//       "assignee_id": 1530104,
//       "assignee_type": "Integration",
//       "assigned_at": "2019-12-09T13:40:21.000Z",
//       "integration": 100043,
//       "account_type": "PAY-WITH-TRANSFER-RECURRING"
//     }
//   }
// }
//