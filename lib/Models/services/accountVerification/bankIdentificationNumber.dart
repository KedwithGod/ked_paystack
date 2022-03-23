// bvn verification is not available
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:royal_palm_villa/Models/models/accountVerification/bankIdentificationNumber.dart';
import '../../utilities/constants.dart';

// GET request to Resolve BVN
class BINVerification{
  String? binNumber;
  BINVerification({this.binNumber});
  // bvn verification from backend
  Future<dynamic> binVerification() async {

    Map<String, String> header = { 'Authorization': 'Bearer $PAYSTACK_KEY'};
    //var data = jsonEncode({"email": "$email", "password": "$password"});
    var url = 'https://api.paystack.co/decision/bin/$binNumber';
    var respond=http.get(Uri.parse(url), headers: header).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      print("Response header: ${response.headers})");
      var parsed=response.body ;
      var decoded =json.decode(parsed);
      return BINResponse.fromJson(decoded);
    });
    respond.then((bvnResponse) {
      print(bvnResponse.status);
      print(bvnResponse.message);
    });
    return respond;
  }
}

/// the bin can be used to verified the user first 6 atm number digit
/// it returns useful data like bank name, linkedBank id,country code, and
/// thing important to confirm the location and type of card used
