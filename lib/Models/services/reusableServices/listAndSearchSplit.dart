//List/Search Splits
// List/search for the transaction splits available on your integration

// A timestamp at which to stop listing splits e.g. 2019-09-24T00:00:05.000Z, 2019-09-21
import 'package:royal_palm_villa/Models/models/transactionSplit/listSearchSplit.dart';

import '../../utilities/constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ListSearchSplit{
  // function to list transaction list
  listSearchSplit(
      {String? name='',
        dynamic active='', // boolean
        dynamic sortBy,// String
        dynamic perPage, // int
        dynamic page, // int
        // get time in DateTime then convert it to iso8601 to fetch it from net
        //DateTime now = DateTime.now();
        // String isoDate = now.toIso8601String();
        dynamic to = '',
        dynamic from = ''})async {
    Map<String, String> header = { 'Authorization': 'Bearer $payStackKey'};
    //var data = jsonEncode({"email": "$email", "password": "$password"});
    var url = 'https://api.paystack.co/split?name=$name&active=$active&sort_by=$sortBy'
        'perPage=$perPage&page=$page&to=${to==""?"":to.toIso8601String()}&from=${from==""?"":from.toIso8601String()}';
    var respond=http.get(Uri.parse(url), headers: header).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      print("Response header: ${response.headers})");
      var parsed=response.body ;
      var decoded =json.decode(parsed);
      return ListSearchSplitResponse.fromJson(decoded);
    });
    respond.then((listSearchSplit) {
      print(listSearchSplit.status);
      print(listSearchSplit.message);
    });
    return respond;
  }

}



