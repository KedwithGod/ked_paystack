//Get details of a split on your integration.

import 'dart:convert';
import 'package:royal_palm_villa/Models/models/transactionSplit/createSplit.dart';
import 'package:http/http.dart' as http;
import '../../utilities/constants.dart';

class UpdateSplitTransaction {
  // function to update split transaction
  Future<dynamic> updateSplitTransaction(
      {
        required int id,
        required String? name ,
      required bool active , // boolean
        String? bearerType,
        String? bearerSubAccount}) async {
    Map<String, String> header = {'Authorization': 'Bearer $PAYSTACK_KEY'};
    var data = jsonEncode({
      "name": "$name", "active": "$active",
      if(bearerType!=null)'bearer_type':bearerType,
      if(bearerSubAccount!=null)'bearer_subaccount':bearerSubAccount
    });
    var url =
        'https://api.paystack.co/split/$id';
    var respond = http.put(Uri.parse(url), headers: header).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      print("Response header: ${response.headers})");
      var parsed = response.body;
      var decoded = json.decode(parsed);
      return CreateSplitResponse.fromJson(decoded);
    });
    respond.then((listSearchSplit) {
      print(listSearchSplit.status);
      print(listSearchSplit.message);
    });
    return respond;
  }
}

///Path Param
// id
// string
// Split ID

/// Body Param
// name
// string
// Name of the transaction split
// active
// boolean
// True or False
// bearer_type
// string
// Any of the following values: subaccount | account | all-proportional | all
// bearer_subaccount
// string
// Subaccount code of a subaccount in the split group. This should be specified only if the bearer_type is subaccount
