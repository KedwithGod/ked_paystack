// this is to resolve user phone number
class FetchPaymentSessionResponse {
  bool? status;
  String? message;
  DataValue? data;


  FetchPaymentSessionResponse({
    this.status,
    this.message,
    this.data
  });


  factory FetchPaymentSessionResponse .fromJson(Map<String, dynamic> json) {
    return FetchPaymentSessionResponse (
        status: json['status'],
        message: json['message'],
        data: DataValue(
          paymentSessionTimeOut: json['data']["payment_session_timeout"],
        ));
  }
}

// class model for data input
class DataValue {
  final int? paymentSessionTimeOut;



  DataValue({this.paymentSessionTimeOut});
}