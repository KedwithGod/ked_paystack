// modal class for the response printed out when a subAccount is
// removed from the user integration

class RemoveSubAccount{
  bool? status;
  String? message;
  RemoveSubAccount({
    this.message,this.status
});
  factory RemoveSubAccount.fromJson(Map<dynamic, dynamic> json){
    return RemoveSubAccount(
      status: json['status'],
      message: json['message']
    );
  }
}