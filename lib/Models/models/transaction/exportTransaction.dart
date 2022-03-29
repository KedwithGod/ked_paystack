// modal class to export transaction as csv

class ExportTransactionResponse{
  bool? status;
  String? message;
  ExportTransactionData? data;
  
  ExportTransactionResponse({
    this.message, this.status, this.data
});

  factory ExportTransactionResponse.fromJson(Map<dynamic, dynamic> json){
    return ExportTransactionResponse(
      status:json['status'],
      message:json['message'],
      data:ExportTransactionData(
          csvDownloadUrl:json['data']['path']
      )
    );
  }
}

class ExportTransactionData {
  String? csvDownloadUrl;
  ExportTransactionData({
    this.csvDownloadUrl
});
}
