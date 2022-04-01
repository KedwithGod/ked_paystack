// POST request for BVN Match
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/accountVerification/bvnMatch.dart';
import '../../utilities/constants.dart';

class BVNMatch{
  // data entry from user
  String? bvn;
  String? accountNumber;
  String? bankCode;
  // function to match user bvn with users account number
  
  bvnMatchFunction(){
    Map<String, String> header = { 'Authorization': 'Bearer $payStackKey'};
    var data = jsonEncode( { "bvn": '$bvn',
      "account_number": "$accountNumber",
      "bank_code":"$bankCode"
    });
    var url = 'https://api.paystack.co/bvn/match';
    var respond=http.post(Uri.parse(url), headers: header,body: data).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      print("Response header: ${response.headers})");
      var parsed=response.body ;
      var decoded =json.decode(parsed);
      return BVNMatchResponse.fromJson(decoded);
    });
    respond.then((bvnResponse) {
      print(bvnResponse.status);
      print(bvnResponse.message);
    });
    return respond;
  }

}


/// for this we will need user to enter bank name
/// then we will use the bank name to fetch bank code from list of bank
/// then with the bank code, user bvn and user account number
/// we can confirm if the user bvn matches the user account number