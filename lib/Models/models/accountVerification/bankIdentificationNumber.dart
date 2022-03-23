// GET request Resolve Card BIN bank identification number

// account verification
class BINResponse {
  bool? status;
  String? message;
  DataValue? data;


  BINResponse({
    this.status,
    this.message,
    this.data
  });


  factory BINResponse .fromJson(Map<String, dynamic> json) {
    return BINResponse (
        status: json['status'],
        message: json['message'],
        data: DataValue(
            bin: json['data']["bin"],
            brand: json['data']["brand"],
            subBrand: json['data']["subBrand"],
          cardType: json['data']['card_type'],
          countryCode: json['data']['country_code'],
          countryName: json['data']['country_name'],
          bank: json['data']['bank'],
          linkedBankId: json['data']['linked_bank_id']
        ));
  }
}



// class model for data input
class DataValue {
  final String? subBrand;
  final String? brand;
  final int? linkedBankId;
  final String? countryCode;
  final String? countryName;
  final String? cardType; // debit, credit
  final String? bin;
  final String? bank;


  DataValue({this.cardType,this.bin,this.bank,this.linkedBankId,
    this.countryName,this.countryCode,this.subBrand,this.brand});
}