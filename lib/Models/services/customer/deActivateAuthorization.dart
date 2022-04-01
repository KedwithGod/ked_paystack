// how to deActive a customer authorization on card

import 'package:royal_palm_villa/Models/models/customer/deActivateAuthorization.dart';
import 'package:royal_palm_villa/Models/models/transaction/chargeAuthorization.dart';

import '../../utilities/constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DeActiveCustomerAuthorization{

  // function to deActive a customer authorization
  Future deActiveCustomerAuthorization(
      {
      required String authorizationCode
    }
      )async{
    Map<String, String> header = { 'Authorization': 'Bearer $payStackKey',
      "Content-Type": "application/json"
    };
    var data = jsonEncode({ "authorization_code": authorizationCode });
    var url = 'https://api.paystack.co/customer/deactivate_authorization';
    var respond=http.post(Uri.parse(url), headers: header,body: data).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      print("Response header: ${response.headers})");
      var parsed=response.body ;
      var decoded =json.decode(parsed);
      return DeActivateAuthorizationResponse.fromJson(decoded);
    });
    respond.then((deActiveAuthorizationResponse) {
      print(deActiveAuthorizationResponse.status);
      print(deActiveAuthorizationResponse.message);
    });
    return respond;
  }

}