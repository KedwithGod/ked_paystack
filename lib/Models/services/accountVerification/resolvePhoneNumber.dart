/// this class is to resolve phone number using
/// true caller api
/// using POST request Resolve Phone Number

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:royal_palm_villa/Models/models/accountVerification/resolvePhoneNumber.dart';
import '../../utilities/constants.dart';

class ResolvePhoneNumber{
  //function to resolve phone number using true caller api
  Future<dynamic> resolvePhoneNumberFunction() async {

    Map<String, String> header = { 'Authorization': 'Bearer $PAYSTACK_KEY'};
    var data = jsonEncode(
      { "verification_type": "truecaller",
        "phone": "2348151535983\n",
        "callback_url": "https://linktopage.com/truecaller"}
    );
    var url = 'https://api.paystack.co/verifications';
    var respond=http.post(Uri.parse(url), headers: header, body: data).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      print("Response header: ${response.headers})");
      var parsed=response.body ;
      var decoded =json.decode(parsed);
      return ResolvePhoneNumberResponse.fromJson(decoded);
    });
    respond.then((bvnResponse) {
      print(bvnResponse.status);
      print(bvnResponse.message);
    });
    return respond;
  }

}