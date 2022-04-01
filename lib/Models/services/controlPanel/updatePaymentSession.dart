// PUT request to Update Payment Session Timeout
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/controlPanel/updatePaymentSession.dart';
import '../../utilities/constants.dart';

class UpdatePaymentSessionTimeOut{

  // to update payment timeout session for a transaction
  Future<dynamic> paymentSessionTimeoutFunction() async {
    Map<String, String> header = { 'Authorization': 'Bearer $payStackKey'};
    //var data = jsonEncode({"email": "$email", "password": "$password"});
    var url = 'https://api.paystack.co/integration/payment_session_timeout';
    var respond=http.put(Uri.parse(url), headers: header).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      print("Response header: ${response.headers})");
      var parsed=response.body ;
      var decoded =json.decode(parsed);
      return UpdatePaymentSessionResponse.fromJson(decoded);
    });
    respond.then((bvnResponse) {
      print(bvnResponse.status);
      print(bvnResponse.message);
    });
    return respond;
  }
}