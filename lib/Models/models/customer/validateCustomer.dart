// model class to validate customer

class ValidateCustomerResponse{
  bool? status;
  String? message;

  ValidateCustomerResponse({
    this.status,this.message
});
  factory ValidateCustomerResponse.fromJson(Map json){
    return ValidateCustomerResponse(
      status: json['status'],
      message: json['message']
    );
  }
}