// function to fetch a single transaction using transaction id
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/transaction/verifyTransaction.dart';
import '../../utilities/constants.dart';

class FetchTransaction{

  // function to verify that a transaction exits
  Future<dynamic> fetchTransaction({required transactionId}) async {
    Map<String, String> header = { 'Authorization': 'Bearer $PAYSTACK_KEY'};
    //var data = jsonEncode({"email": "$email", "password": "$password"});
    var url = 'https://api.paystack.co/transaction/$transactionId';
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

//p0qi90zhwx1bvrr
}