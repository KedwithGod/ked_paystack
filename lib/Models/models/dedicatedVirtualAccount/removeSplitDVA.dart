// remove split DVA

class RemoveSplitDVAResponse{
  bool? status;
  String? message;
  RemoveSplitDVAData? data;

  RemoveSplitDVAResponse({
    this.data,this.message,this.status
});

  factory RemoveSplitDVAResponse.fromJson(Map json){
    return RemoveSplitDVAResponse(
      status: json['status'],
      message:json['message'],
      data: RemoveSplitDVAData(
        accountName:json['data']['account_name'],
        currency:json['data']['currency'],
        accountNumber:json['data']['account_number'],
        createdAt:json['data']['created_at'],
        updatedAt:json['data']['updated_at'],
        assigned:json['data']['assigned'],
        active:json['data']['active'],
        splitConfiguration:json['data']['split_config'],
        dVAid:json['data']['id'],
      )
    );
  }
}

class RemoveSplitDVAData {
  String? accountName, currency,accountNumber,createdAt,updatedAt;
  bool? assigned, active;
  dynamic splitConfiguration;
  int? dVAid;

  RemoveSplitDVAData({
    this.accountName,
    this.currency,
    this.accountNumber,
    this.createdAt,
    this.updatedAt,
    this.assigned,
    this.active,
    this.splitConfiguration,
    this.dVAid
});
}


/// sample response
/// {
//   "status": "success",
//   "message": "Subaccount unassigned",
//   "data": {
//     "id": 22173,
//     "split_config": NULL,
//     "account_name": "KAROKART/YINKA ADE",
//     "account_number": "0033322211",
//     "currency": "NGN",
//     "assigned": true,
//     "active": true,
//     "createdAt": "2020-03-11T15:14:00.707Z",
//     "updatedAt": "2020-03-11T15:14:00.707Z",
//   }
// }