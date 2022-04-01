// fetch split transaction uses thesame model as that of the create split
// model class
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:royal_palm_villa/Models/models/transactionSplit/createSplit.dart';
import '../../utilities/constants.dart';

class FetchSplitTransaction{
  // function to fetch split transaction with an id
  Map<String, String> header = {
    'Authorization': 'Bearer $payStackKey',
    "Content-Type": "application/json"
  };
  fetchSplitTransaction(
      {required int id}
      )async{
    var url = 'https://api.paystack.co/split/$id';
    var respond =
    http.get(Uri.parse(url), headers: header).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      print("Response header: ${response.headers})");
      var parsed = response.body;
      var decoded = json.decode(parsed);
      return CreateSplitResponse.fromJson(decoded);
    });
    respond.then((fetchSplitTransaction) {
      print(fetchSplitTransaction.status);
      print(fetchSplitTransaction.message);
    });
    return respond;
  }
}