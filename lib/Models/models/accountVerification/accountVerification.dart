// account verification
class AccountVerificationResponse {
  bool? status;
  String? message;
  DataValue? data;


  AccountVerificationResponse({
    this.status,
    this.message,
    this.data
  });


  factory AccountVerificationResponse .fromJson(Map<String, dynamic> json) {
    return AccountVerificationResponse (
        status: json['status'],
        message: json['message'],
        data: DataValue(
          accountName: json['data']["account_number"],
          accountNumber: json['data']["account_name"],
          bankId: json['data']["bank_id"]
        ));
  }
}

// class model for data input
class DataValue {
  final String? accountNumber;
  final String? accountName;
  final int? bankId;

 DataValue({this.accountNumber,this.accountName, this.bankId});
}