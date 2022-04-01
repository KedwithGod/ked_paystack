// Create Split
// Create a split payment on your integration

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:royal_palm_villa/Models/models/transactionSplit/createSplit.dart';
import '../../utilities/constants.dart';

class CreateSplit{
  // function to create split transaction

  Future<dynamic> createSplit  ({
    required String? name,
    required String? type,
    required String? currency,
    required List<SubAccountEntry> subAccounts,
    required String? bearerType,
    required String? bearerSubAccount,

  }) async {
    Map<String, String> header = {
      'Authorization': 'Bearer $payStackKey',
      "Content-Type": "application/json"
    };
    var data = jsonEncode({
      "name":name,
      "type":type,
      "currency":currency,
      "subaccounts":subAccounts,
      "bearer_type":bearerType,
      "bearer_subaccount":bearerSubAccount
    });
    var url = 'https://api.paystack.co/transaction/partial_debit';
    var respond =
    http.post(Uri.parse(url), headers: header, body: data).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      print("Response header: ${response.headers})");
      var parsed = response.body;
      var decoded = json.decode(parsed);
      return CreateSplitResponse.fromJson(decoded);
    });
    respond.then((partialDebit) {
      print(partialDebit.status);
      print(partialDebit.message);
    });
    return respond;
  }
}

// subAccount class to add class value
// the list of the sub account must be format thus
// input the subAccountEntry, then call toJson on the class
// to convert it to a map

  class SubAccountEntry{
  String? subAccount;
  int? share;
  SubAccountEntry({required this.share, required this.subAccount});

  Map<String, dynamic> toJson() => {
    'subaccount': subAccount,
    'share': share,
  };
  }


//Body Param
// name
// string
// Name of the transaction split
// type
// string
// The type of transaction split you want to create. You can use one of the following: percentage | flat
// currency
// string
// Any of NGN, GHS, ZAR, or USD
// subaccounts
// array
// A list of object containing subaccount code and number of shares: [{subaccount: ‘ACT_xxxxxxxxxx’, share: xxx},{...}]
// bearer_type
// string
// Any of subaccount | account | all-proportional | all
// bearer_subaccount
// string
// Subaccount code