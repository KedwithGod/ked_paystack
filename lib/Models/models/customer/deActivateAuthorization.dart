// class to deActivate customer's authorization

class DeActivateAuthorizationResponse{
  bool? status;
  String? message;

  DeActivateAuthorizationResponse({
    this.status,this.message
});

  factory DeActivateAuthorizationResponse.fromJson(Map json){
    return DeActivateAuthorizationResponse(
      status: json['status'],
      message: json['message']
    );
  }
}