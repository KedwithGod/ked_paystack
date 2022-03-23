// this is to resolve user phone number
class BVNMatchResponse {
  bool? status;
  String? message;
  MetaValue? meta;
  DataValue? data;


  BVNMatchResponse({
    this.status,
    this.message,
    this.meta,
    this.data
  });


  factory BVNMatchResponse .fromJson(Map<String, dynamic> json) {
    return BVNMatchResponse (
        status: json['status'],
        message: json['message'],
        meta: MetaValue(
          callThisMonth: json['meta']["calls_this_month"],
          freeCallLeft: json['meta']["free_calls_left"],
        ),
      data: DataValue(
        bvn: json['data']['bvn'],
        isBlackListed: json['data']['is_blacklisted']
      )
    );

  }
}

// class model for meta input
class MetaValue {
  final int? callThisMonth;
  final int? freeCallLeft;


  MetaValue({this.callThisMonth, this.freeCallLeft});
}

// class model for data input
class DataValue {
  final String? bvn;
  final bool? isBlackListed;


  DataValue({this.bvn, this.isBlackListed});
}