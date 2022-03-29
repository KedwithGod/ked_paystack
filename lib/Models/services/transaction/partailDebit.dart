// a function to carryout partial debit on customer's account

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:royal_palm_villa/Models/models/transaction/partailDebit.dart';

import '../../utilities/constants.dart';

class PartialDebit {
  // function to verify that a transaction exits
  Future<dynamic> partialDebit({
    required String? authorizationCode,
    required String? currency,
    required String? amount,
    required String? email,
    String? reference,
    String? atLeast,
  }) async {
    Map<String, String> header = {
      'Authorization': 'Bearer $PAYSTACK_KEY',
      "Content-Type": "application/json"
    };
    var data = jsonEncode({
      "authorization_code":authorizationCode,
      "currency": currency,
      "amount": amount,
      "email": email,
     if(reference!=null) 'reference':reference,
      if(atLeast!=null)'at_least':atLeast
    });
    var url = 'https://api.paystack.co/transaction/partial_debit';
    var respond =
        http.post(Uri.parse(url), headers: header, body: data).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      print("Response header: ${response.headers})");
      var parsed = response.body;
      var decoded = json.decode(parsed);
      return PartialDebitResponse.fromJson(decoded);
    });
    respond.then((partialDebit) {
      print(partialDebit.status);
      print(partialDebit.message);
    });
    return respond;
  }
}

///Body Param
// authorization_code
// string
// Authorization Code
// currency
// string
// Specify the currency you want to debit. Allowed values are NGN, GHS, ZAR or USD.
// amount
// string
// Amount should be in kobo if currency is NGN, pesewas, if currency is GHS, and cents, if currency is ZAR
// email
// string
// Customer's email address (attached to the authorization code)
// reference
// string
// Unique transaction reference. Only -, ., = and alphanumeric characters allowed.
// at_least
// string
// Minimum amount to charge
