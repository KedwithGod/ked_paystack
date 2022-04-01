/// List Dedicated Accounts
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:royal_palm_villa/Models/models/dedicatedVirtualAccount/listDVA.dart';
import '../../utilities/constants.dart';

class ListDVA{

  // function to list dedicated virtual accounts in your integration
  listDVA(
      {
        required bool? active,
        required String? currency,
        String? providerSlug='',
        String? bankId='',String? customerId='',
        // check beneath this class you will see a guide to the meaning
        // all this parameter
      }
      )async{
    var headers = {
      'Authorization': 'Bearer $payStackKey',
    };

    var url = 'https://api.paystack.co/dedicated_account?'
        '?provider_slug=$providerSlug&bank_id=$bankId&customer=$customerId';
    var respond=http.get(Uri.parse(url), headers: headers).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      print("Response header: ${response.headers})");
      var parsed=response.body ;
      var decoded =json.decode(parsed);
      return ListDVAResponse.fromJson(decoded);
    });
    respond.then((deActiveAuthorizationResponse) {
      print(deActiveAuthorizationResponse.status);
      print(deActiveAuthorizationResponse.message);
    });
    return respond;
  }
}


///Query Param
// active
// boolean
// Status of the dedicated virtual account
// currency
// string
// The currency of the dedicated virtual account. Only NGN is currently allowed
// provider_slug
// string
// The bank's slug in lowercase, without spaces e.g. wema-bank
// bank_id
// string
// The bank's ID e.g. 035
// customer
// string
// The customer's ID