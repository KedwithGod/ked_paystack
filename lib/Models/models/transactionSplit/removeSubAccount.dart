// modal class for the response printed out when a subAccount is
// removed from the user integration

class RemoveSubAccountResponse{
  bool? status;
  String? message;
  RemoveSubAccountResponse({
    this.message,this.status
});
  factory RemoveSubAccountResponse.fromJson(Map<dynamic, dynamic> json){
    return RemoveSubAccountResponse(
      status: json['status'],
      message: json['message']
    );
  }
}