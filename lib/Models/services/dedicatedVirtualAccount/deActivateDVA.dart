// class to deActivate a dedicated virtual account from your integration
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:royal_palm_villa/Models/models/dedicatedVirtualAccount/deActivateDVA.dart';
import '../../utilities/constants.dart';
class DeActivateDVA{

  // a function to deActivateDVA
  deActivateDVA({required int? dedicatedVAid
})async{
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