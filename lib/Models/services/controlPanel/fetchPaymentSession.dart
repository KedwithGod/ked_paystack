// GET request to lFetch Payment Session Timeout

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/controlPanel/fetchPaymentSession.dart';
import '../../utilities/constants.dart';

// GET request to Resolve BVN
class PaymentSessionTimeout{

  // user input
  String? name;
  String? description;
  String? accountNumber;
  String? currency;
  String? bankCode;



  // to retrieve payment timeout session for a transaction
  Future<dynamic> paymentSessionTimeoutFunction() async {
    var headers = {
      'Authorization': 'Bearer $payStackKey'
    };
    var request = http.Request('GET', Uri.parse(
        'https://api.paystack.co/integration/payment_session_timeout'));
    request.bodyFields = {
      'type': 'nuban', // nigeria universal bank account number 10 digit code
      'name': '$name',
      'description': '$description',
      'account_number': '$accountNumber',
      'bank_code': '$bankCode',
      'currency': '$currency'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // first convert from internalHashLink<dynamic, String> to Map<dynamic, dynamic> and parse it
      var decodedOutPut=json.decode((await response.stream.bytesToString()));
      // int FetchPaymentSessionResponse class
      return FetchPaymentSessionResponse.fromJson(decodedOutPut);
    }
    else {
      print(response.reasonPhrase);
    }
  }
}