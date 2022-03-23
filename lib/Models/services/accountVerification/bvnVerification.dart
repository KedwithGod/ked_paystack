// bvn verification is not available
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:royal_palm_villa/Models/models/accountVerification/bvnVerification.dart';
import '../../utilities/constants.dart';

// GET request to Resolve BVN
class BvnVerification{
  String? bvnNumber;
  BvnVerification({this.bvnNumber});
  // bvn verification from backend
  Future<dynamic> bvnVerification() async {
    Map<String, String> header = { 'Authorization': 'Bearer $PAYSTACK_KEY'};
    //var data = jsonEncode({"email": "$email", "password": "$password"});
    var url = 'https://api.paystack.co/bank/resolve_bvn/$bvnNumber';
    var respond=http.get(Uri.parse(url), headers: header).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      print("Response header: ${response.headers})");
      var parsed=response.body ;
      var decoded =json.decode(parsed);
      return BvnResponse.fromJson(decoded);
    });
    respond.then((bvnResponse) {
      print(bvnResponse.status);
      print(bvnResponse.message);
    });
    return respond;
  }
}


/// this is used to return if bvn is verified
/// but then the service is unavailable