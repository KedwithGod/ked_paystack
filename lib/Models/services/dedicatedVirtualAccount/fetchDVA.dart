// fetch a dedicated virtual account using DVA id
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:royal_palm_villa/Models/models/dedicatedVirtualAccount/fetchDVA.dart';
import '../../utilities/constants.dart';

class FetchDVA{

  // create a function to fetch DVA using id
  fetchDVA({
    required int? dedicatedVAid
})async{
    var headers = {
      'Authorization': 'Bearer $payStackKey',
    };

    var url = 'https://api.paystack.co/dedicated_account/$dedicatedVAid';
    var respond=http.get(Uri.parse(url), headers: headers).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      print("Response header: ${response.headers})");
      var parsed=response.body ;
      var decoded =json.decode(parsed);
      return FetchDVAResponse.fromJson(decoded);
    });
    respond.then((deActiveAuthorizationResponse) {
      print(deActiveAuthorizationResponse.status);
      print(deActiveAuthorizationResponse.message);
    });
    return respond;
  }
  }


///Path Param
// dedicated_account_id
// integer
// ID of dedicated virtual account