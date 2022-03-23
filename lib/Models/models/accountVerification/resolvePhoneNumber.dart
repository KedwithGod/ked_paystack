// this is to resolve user phone number
class ResolvePhoneNumberResponse {
  bool? status;
  String? message;
  DataValue? data;


  ResolvePhoneNumberResponse({
    this.status,
    this.message,
    this.data
  });


  factory ResolvePhoneNumberResponse .fromJson(Map<String, dynamic> json) {
    return ResolvePhoneNumberResponse (
        status: json['status'],
        message: json['message'],
        data: DataValue(
            requestId: json['data']["requestId"],
            state: json['data']["state"],
        ));
  }
}

// class model for data input
class DataValue {
  final String? requestId;
  final String? state;


  DataValue({this.state, this.requestId});
}