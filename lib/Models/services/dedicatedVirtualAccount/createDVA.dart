// this is a service to create a dedicated virtual account for customers
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:royal_palm_villa/Models/models/dedicatedVirtualAccount/createDVA.dart';
import '../../utilities/constants.dart';

class CreateDVA{

  // function to create a DVA
  Future createDVA({
    required String? customerIdOrCode,
  ///Testing Dedicated Virtual Accounts
    // To create Dedicated Virtual Accounts using your test secret key,
    // use test-bank as the preferred_bank in the request body parameters.
    // You can also make a transfer to the test virtual accounts using our
    // demo bank app.
    String? preferredBank,String? subAccount, String? firstName,
    String? lastName,String? phone, String? splitCode

  }
      ) async{
    var headers = {
      'Authorization': 'Bearer $payStackKey',
          "Content-Type": "application/json"
    };
    var data = jsonEncode({ "customer":customerIdOrCode,
      if(preferredBank!=null)"preferred_bank":preferredBank,
        if(subAccount!=null)"subaccount":subAccount, if(splitCode!=null)"split_code":splitCode,
      if(firstName!=null)"first_name":firstName,
      if(lastName!=null)"last_name":lastName,
      if(phone!=null)"phone":phone
    });
    var url = 'https://api.paystack.co/dedicated_account';
    var respond=http.post(Uri.parse(url), headers: headers,body: data).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      print("Response header: ${response.headers})");
      var parsed=response.body ;
      var decoded =json.decode(parsed);
      return CreateDVAResponse.fromJson(decoded);
    });
    respond.then((deActiveAuthorizationResponse) {
      print(deActiveAuthorizationResponse.status);
      print(deActiveAuthorizationResponse.message);
    });
    return respond;
}}


///Body Param
// customer
// string
// Customer ID or code
// preferred_bank
// string
// The bank slug for preferred bank. To get a list of available banks, use the List Providers endpoint
// subaccount
// string
// Subaccount code of the account you want to split the transaction with
// split_code
// string
// Split code consisting of the lists of accounts you want to split the transaction with
// first_name
// string
// Customer's first name
// last_name
// string
// Customer's last name
// phone
// string
// Customer's phone number