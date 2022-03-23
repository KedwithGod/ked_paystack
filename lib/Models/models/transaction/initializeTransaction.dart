// account verification
class InitializeTransactionResponse {
  bool? status;
  String? message;
  DataValue? data;


  InitializeTransactionResponse({
    this.status,
    this.message,
    this.data
  });


  factory InitializeTransactionResponse .fromJson(Map<String, dynamic> json) {
    return InitializeTransactionResponse (
        status: json['status'],
        message: json['message'],
        data: DataValue(
            authorizationUrl: json['data']["authorization_url"],
            accessCode: json['data']["access_code"],
            reference: json['data']["reference"]
        ));


  }
}

// class model for data input
class DataValue {
  final String? authorizationUrl;
  final String? accessCode;
  final String? reference;

  DataValue({this.authorizationUrl,this.accessCode, this.reference});
}