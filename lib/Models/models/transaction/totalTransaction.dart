

// model class for viewing transaction timeLine
class TotalTransactionResponse{
  bool? status;
  String? message;
  DataValue? data;
  
  TotalTransactionResponse({
   this.status, this.message, this.data 
});
  
  factory TotalTransactionResponse.fromJson(Map<dynamic, dynamic> json){
    return TotalTransactionResponse(
      status: json['status'],
      message: json['message'],
      data: DataValue(
        totalVolume: json['data']['total_volume'] ??0,
        totalTransaction: json['data']['total_transactions']??0,
        uniqueCustomers: json['data']['unique_customers']??0,
        totalVolumeByCurrency: TotalVolumeByCurrency(
          currency: json['data']['total_volume_by_currency'][0]['currency']??"not stated",
          amount:  json['data']['total_volume_by_currency'][0]['amount']??0
        ),
        pendingTransferByCurrency: PendingTransferByCurrency(
          currency: json['data']['pending_transfers_by_currency'][0]['currency']??"not stated",
          amount: json['data']['pending_transfers_by_currency'][0]['amount']??0
        ),
        pendingTransfers: json['data']['pending_transfers']??0
        
      )
    );
  }
  
}


class DataValue{
  int? totalTransaction;
  int? uniqueCustomers;
  int? totalVolume;
  TotalVolumeByCurrency? totalVolumeByCurrency;
  int? pendingTransfers;
  PendingTransferByCurrency? pendingTransferByCurrency;
  
  DataValue({this.totalVolume, this.pendingTransferByCurrency,this.pendingTransfers,
      this.totalTransaction, this.totalVolumeByCurrency, this.uniqueCustomers}
      );
}

class PendingTransferByCurrency {
  int? amount;
  String? currency;
  PendingTransferByCurrency({this.currency,this.amount});
}

class TotalVolumeByCurrency {
  int? amount;
  String? currency;
  TotalVolumeByCurrency({this.currency,this.amount});
}

