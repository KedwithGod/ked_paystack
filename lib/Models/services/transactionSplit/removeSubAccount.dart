// Remove a subAccount from a transaction split
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:royal_palm_villa/Models/models/transactionSplit/createSplit.dart';
import 'package:royal_palm_villa/Models/models/transactionSplit/removeSubAccount.dart';
import '../../utilities/constants.dart';

class RemoveSubAccount{

  // a function to remove subAccount
  Future removeSubAccount ({
    required int? id,
    required String subAccount, // boolean// String
  })async {
    Map<String, String> header = { 'Authorization': 'Bearer $PAYSTACK_KEY'};
    // body parameter
    var data = jsonEncode({ "subaccount": subAccount });
    var url = 'https://api.paystack.co/split/$id/subaccount/remove';
    var respond=http.post(Uri.parse(url), headers: header,body: data).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      print("Response header: ${response.headers})");
      var parsed=response.body ;
      var decoded =json.decode(parsed);
      return RemoveSubAccountResponse.fromJson(decoded);
    });
    respond.then((removeSubAccount) {
      print(removeSubAccount.status);
      print(removeSubAccount.message);
    });
    return respond;
  }}