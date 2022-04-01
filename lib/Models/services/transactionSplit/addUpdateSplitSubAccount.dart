//Add a Subaccount to a Transaction Split, or update the share of an existing
// Subaccount in a Transaction Split
// Note: this class also uses the create split transaction model class for
// from json refracting

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:royal_palm_villa/Models/models/transactionSplit/createSplit.dart';
import '../../utilities/constants.dart';

class AddUpdateSplitSubAccount{
  // a function to add and update the subAccount in the transaction split
  Future<dynamic> addUpdateSplitSubAccount({
    required int? id,
     required String subAccount, // boolean
    required int? share,// String
    })async {
  Map<String, String> header = { 'Authorization': 'Bearer $payStackKey'};
  // body parameter
  var data = jsonEncode({ "subaccount": subAccount, "share": share });
  var url = 'https://api.paystack.co/split/$id/subaccount/add';
  var respond=http.post(Uri.parse(url), headers: header,body: data).then((response) {
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
    print("Response header: ${response.headers})");
    var parsed=response.body ;
    var decoded =json.decode(parsed);
    return CreateSplitResponse.fromJson(decoded);
  });
  respond.then((addUpdateSubAccount) {
  print(addUpdateSubAccount.status);
  print(addUpdateSubAccount.message);
  });
  return respond;
  }
}



///Path Param
// id
// string
// Split Id

// Body Param
// subaccount
// string
// This is the sub account code
// share
// integer
// This is the transaction share for the subaccount