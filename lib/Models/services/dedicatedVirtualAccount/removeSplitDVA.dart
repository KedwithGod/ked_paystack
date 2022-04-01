// Remove Split from Dedicated Account
// If you've previously set up split payment for
// transactions on a dedicated virtual account,
// you can remove it with this endpoint
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:royal_palm_villa/Models/models/dedicatedVirtualAccount/deActivateDVA.dart';
import '../../utilities/constants.dart';

class RemoveSplitDVA{

  // function to remove split from DVA
  removeSplitDVa()async{
    var headers = {
      'Authorization': 'Bearer $payStackKey',
    };

    var url = 'https://api.paystack.co/dedicated_account/$dedicatedVAid';
    var respond=http.delete(Uri.parse(url), headers: headers).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      print("Response header: ${response.headers})");
      var parsed=response.body ;
      var decoded =json.decode(parsed);
      return DeActiveDVAResponse.fromJson(decoded);
    });
    respond.then((deActiveAuthorizationResponse) {
      print(deActiveAuthorizationResponse.status);
      print(deActiveAuthorizationResponse.message);
    });
    return respond;
  }
  }
}

///Body Param
// account_number
// string
// Dedicated virtual account number