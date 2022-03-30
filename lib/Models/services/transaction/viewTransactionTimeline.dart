// class to view the time line of a transaction
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:royal_palm_villa/Models/utilities/constants.dart';

import '../../models/transaction/viewTransactionTimeLine.dart';
class ViewTransactionTimeLine{

  // function to a single transaction timeline
  viewTransactionTimeLine(
      {required int? transactionId}
      ) async{
    var headers = {
      'Authorization': 'Bearer $PAYSTACK_KEY'
    };
    var request = http.MultipartRequest('GET', Uri.parse('https://api.paystack.co/transaction/timeline/$transactionId'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // first convert from internalHashLink<dynamic, String> to Map<dynamic, dynamic> and parse it
      var decodedOutPut=json.decode((await response.stream.bytesToString()));
      // into initializeTransactionResponse class
      return ViewTransactionTimeLineResponse.fromJson(decodedOutPut);
    }
    else {
    print(response.reasonPhrase);
    }
  }
}