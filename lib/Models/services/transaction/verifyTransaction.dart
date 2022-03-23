// this is to verify transaction using the reference number
//
 import '../../models/transaction/verifyTransaction.dart';
import '../../utilities/constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/accountVerification/accountVerification.dart';

class VerifyTransaction{

  String? reference;
  VerifyTransaction({this.reference});

  // function to verify that a transaction exits
   Future<dynamic> verifyTransactionFunction() async {
     Map<String, String> header = { 'Authorization': 'Bearer $PAYSTACK_KEY'};
     //var data = jsonEncode({"email": "$email", "password": "$password"});
     var url = 'https://api.paystack.co/transaction/verify/$reference';
     var respond=http.get(Uri.parse(url), headers: header).then((response) {
       print("Response status: ${response.statusCode}");
       print("Response body: ${response.body}");
       print("Response header: ${response.headers})");
       var parsed=response.body ;
       var decoded =json.decode(parsed);
       return VerifyTransactionResponse.fromJson(decoded);
     });
     respond.then((bvnResponse) {
       print(bvnResponse.status);
       print(bvnResponse.message);
     });
     return respond;
   }

 }

