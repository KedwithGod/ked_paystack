// function to print your transaction history as csv

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/transaction/exportTransaction.dart';
import '../../utilities/constants.dart';

class ExportTransaction{

  // function to get history off transaction
  exportTransaction(
      {

    // query parameter
        int? perPage=50, int? page=1,
    int? paymentPageId,bool? settled,
    int? customerId,
    String? currency,
    int? settlementId,
    String? amount,String? status, // failed, success, abandoned
        // get time in DateTime then convert it to iso8601 to fetch it from net
        //DateTime now = DateTime.now();
        // String isoDate = now.toIso8601String();
        dynamic to='',
        dynamic from=''

}
      ) async{


    var headers = {
      'Authorization': 'Bearer $PAYSTACK_KEY'
    };
    var request = http.MultipartRequest(
        'GET', Uri.parse(
        'https://api.paystack.co/transaction/export?perPage=$perPage&page=$page'
            '&to=${to==""?"":to.toIso8601String()}'
            '&from=${from==""?"":from.toIso8601String()}&customer=$customerId&status=$status'
            '&currency=$currency&amount=$amount&settled=$settled&settlement=$settlementId&'
            'payment_page=$paymentPageId'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var decodedOutPut=json.decode((await response.stream.bytesToString()));
    // into initializeTransactionResponse class
    return ExportTransactionResponse.fromJson(decodedOutPut);
    }
    else {
    print(response.reasonPhrase);
    }
  }
}


///Query Param
// perPage
// integer
// Specify how many records you want to retrieve per page. If not specify we use a default value of 50.
// page
// integer
// Specify exactly what page you want to retrieve. If not specify we use a default value of 1.
// from
// datetime
// A timestamp from which to start listing transaction e.g. 2016-09-24T00:00:05.000Z, 2016-09-21
// to
// datetime
// A timestamp at which to stop listing transaction e.g. 2016-09-24T00:00:05.000Z, 2016-09-21
// customer
// integer
// Specify an ID for the customer whose transactions you want to retrieve
// status
// string
// Filter transactions by status ('failed', 'success', 'abandoned')
// currency
// string
// Specify the transaction currency to export. Allowed values are: in kobo if currency is NGN, pesewas, if currency is GHS, and cents, if currency is ZAR
// amount
// integer
// Filter transactions by amount. Specify the amount, in kobo if currency is NGN, pesewas, if currency is GHS, and cents, if currency is ZAR
// settled
// boolean
// Set to true to export only settled transactions. false for pending transactions. Leave undefined to export all transactions
// settlement
// integer
// An ID for the settlement whose transactions we should export
// payment_page
// integer
// Specify a payment page's id to export only transactions conducted on said page