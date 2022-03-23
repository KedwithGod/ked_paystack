class BankListResponse {
  String? name;
  String? slug;
  String? code;
  String? longCode;
  String? gateway;
  bool? payWithBank;
  bool? active;
  bool? isDeleted;
  String? country;
  String? currency;
  String? type;
  int? id;
  String? createdAt;
  String? updatedAt;

  BankListResponse({
    this.name,
    this.slug,
    this.createdAt,
    this.code,
    this.country,
    this.active,
    this.currency,
    this.gateway,
    this.id,
    this.isDeleted,
    this.longCode,
    this.payWithBank,
    this.type,
    this.updatedAt
});


  factory BankListResponse .fromJson(Map<String, dynamic> json) {
    return BankListResponse (
      name: json['name'],
      slug: json['slug'],
      createdAt: json['createdAt'],
      code: json['code'],
      currency: json['currency'],
      country: json['country'],
      longCode: json['longCode'],
      active: json['active'],
      gateway: json['gateway'],
      id: json['id'],
      isDeleted: json["is_deleted"],
      payWithBank: json['"pay_with_bank"'],
      updatedAt:json['updatedAt'],
      type: json['type'],

    );
  }
}