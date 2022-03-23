// this is to resolve user phone number
class UpdatePaymentSessionResponse {
  bool? status;
  String? message;
  DataValue? data;


  UpdatePaymentSessionResponse({
    this.status,
    this.message,
    this.data
  });


  factory UpdatePaymentSessionResponse .fromJson(Map<String, dynamic> json) {
    return UpdatePaymentSessionResponse (
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