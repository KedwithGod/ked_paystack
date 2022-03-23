// bank verification modal class

class BvnResponse {
  bool? status;
  String? message;


  BvnResponse({
    this.status,
    this.message,
  });


  factory BvnResponse .fromJson(Map<String, dynamic> json) {
    return BvnResponse (
      status: json['status'],
      message: json['message'],
    );
  }
}