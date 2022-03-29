// class for view transaction model
class ViewTransactionTimeLineResponse{
  bool? status;
  String? message;
  DataValue? data;

  ViewTransactionTimeLineResponse({
    this.data, this.message, this.status
});

  factory ViewTransactionTimeLineResponse.fromJson(Map<dynamic,dynamic> json){
    return ViewTransactionTimeLineResponse(
      status: json['status'],
      message: json['message'],
      data: DataValue(
        timeSpent: json['data']['time_spent'],
        attempts: json['data']['attempts'],
        authentication: json['data']['authentication'],
        errors: json['data']['errors'],
        success: json['data']['success'],
        mobile: json['data']['mobile'],
        input: json['data']['input'],
        channel: json['data']['channel'],
        history:json['data']['history']
      )
    );
  }
}

class DataValue{
  int? timeSpent; // this time is in seconds you can convert it to minutes,
// or hours or days
  int? attempts;
  dynamic authentication;
  int? errors;
  bool? success;
  bool? mobile;
  List? input;
  dynamic channel;
  List? history;

  DataValue(
  {
    this.success,this.attempts,this.authentication,this.channel,this.errors,
    this.history,this.input,this.mobile,this.timeSpent
}
      );

}

// this will be used to output the history List, when you want
// to output it with this format
// "type": "action",
// "message": "Set payment method to: bank",
// "time": 13
class ViewTransactionTimeLineHistory {
  final String? type;
  final String? message;
  final int? time;

  ViewTransactionTimeLineHistory({this.type, this.message, this.time});

  factory ViewTransactionTimeLineHistory.fromJson(Map<dynamic, dynamic> json){
    return ViewTransactionTimeLineHistory(
        type: json['type'],
      message: json['message'],
      time: json['time']
    );
  }

}

/// how to use the ViewTransactionTimeLineHistory
///