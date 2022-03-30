// model class for creating customers

class CreateCustomerResponse{
  bool? status;
  String? message;
  CreateCustomerData? data;

  CreateCustomerResponse({this.status,this.message,this.data});

  // create a factory class to decode json response
factory CreateCustomerResponse.fromJson(Map json){
  return CreateCustomerResponse(
    status: json['status'],
    message: json['message'],
    data: CreateCustomerData(
      email: json['data']['email'],
        integration: json['data']['integration'],
        domain: json['data']['domain'],
        customerCode: json['data']['customer_code'],
        customerId: json['data']['id'],
        identified: json['data']['identified'],
        identifications: json['data']['identifications'],
        createdAt: json['data']['createdAt'],
        updatedAt: json['data']['updatedAt'],
    )
  );
}
}

class CreateCustomerData {
  String? email;
  int? integration;
  String? domain;
  String? customerCode;
  int? customerId;
  bool? identified;
  dynamic identifications;
  String? createdAt;
  String? updatedAt;
  CreateCustomerData({
    this.updatedAt,this.integration,this.domain,this.createdAt,this.customerId,
    this.customerCode,this.email,this.identifications,this.identified
});
}



// Example of the response
///{
//   "status": true,
//   "message": "Customer created",
//   "data": {
//     "email": "customer@email.com",
//     "integration": 100032,
//     "domain": "test",
//     "customer_code": "CUS_xnxdt6s1zg1f4nx",
//     "id": 1173,
//     "identified": false,
//     "identifications":null,
//     "createdAt": "2016-03-29T20:03:09.584Z",
//     "updatedAt": "2016-03-29T20:03:09.584Z"
//   }
// }
