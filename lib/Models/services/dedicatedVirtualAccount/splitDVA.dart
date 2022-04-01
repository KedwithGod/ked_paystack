// Split Dedicated Account Transaction
// Split a dedicated virtual account transaction with one or more accounts
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:royal_palm_villa/Models/models/dedicatedVirtualAccount/splitDVA.dart';
import '../../utilities/constants.dart';

class SplitDVA{

  // function to split DVA
  splitDVA(
      {required String? customerIdOrCode,

      ///Testing Dedicated Virtual Accounts
      // To create Dedicated Virtual Accounts using your test secret key,
      // use test-bank as the preferred_bank in the request body parameters.
      // You can also make a transfer to the test virtual accounts using our
      // demo bank app.
      String? preferredBank,
      String? subAccount,
      String? splitCode})async {
    var headers = {
      'Authorization': 'Bearer $payStackKey',
      "Content-Type": "application/json"
    };

    var data = jsonEncode({ "customer":customerIdOrCode,
      if(preferredBank!=null)"preferred_bank":preferredBank,
       if(splitCode!=null)"split_code":splitCode,
    });
    var url = 'https://api.paystack.co/dedicated_account';
    var respond=http.post(Uri.parse(url), headers: headers,body: data).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      print("Response header: ${response.headers})");
      var parsed=response.body ;
      var decoded =json.decode(parsed);
      return SplitDVAResponse.fromJson(decoded);
    });
    respond.then((deActiveAuthorizationResponse) {
      print(deActiveAuthorizationResponse.status);
      print(deActiveAuthorizationResponse.message);
    });
    return respond;
  }
}


/// sample response
/// Body Param
// customer
// string
// Customer ID or code
// subaccount
// string
// Subaccount code of the account you want to split the transaction with
// split_code
// string
// Split code consisting of the lists of accounts you want to split the transaction with
// preferred_bank
// string
// The bank slug for preferred bank. To get a list of available banks, use the List Providers endpoint