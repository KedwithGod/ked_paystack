import 'package:royal_palm_villa/Models/models/transaction/verifyTransaction.dart';

class ListOfTransactionResponse {
  bool? status;
  String? message;
  List? data;
  Meta? meta;

  /*
  "meta": {
        "total": 3,
        "": 50135,
        "skipped": 0,
        "perPage": 50,
        "page": 1,
        "pageCount": 1
    }
  */

  ListOfTransactionResponse({this.status, this.message, this.data,this.meta});

  factory ListOfTransactionResponse.fromJson(Map<String, dynamic> json) {
    return ListOfTransactionResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'],
      meta:Meta(
        total: json['meta']['total'],
        totalVolume: json['meta']['total_volume'],
        skipped: json['meta']['skipped'],
        page: json['meta']['page'],
        pageCount: json['meta']['pageCount'],
        perPage: json['meta']==null || json['meta']==""?"0":json['meta']['perPage']
      )
    );
  }
}

class Meta {
  int? total, totalVolume, skipped,page,pageCount;
  dynamic perPage;
  Meta({
    this.page,this.pageCount,this.perPage,this.skipped,this.total,this.totalVolume
});

}