//List/Search Splits
// List/search for the transaction splits available on your integration

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
  Map<String, String> header = { 'Authorization': 'Bearer $PAYSTACK_KEY'};
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



///Query Param
// name
// string
// The name of the split
// active
// boolean
// Any of true or false
// sort_by
// string
// Sort by name, defaults to createdAt date
// perPage
// integer
// Number of splits per page. If not specify we use a default value of 50.
// page
// integer
// Page number to view. If not specify we use a default value of 1.
// from
// datetime
// A timestamp from which to start listing splits e.g. 2019-09-24T00:00:05.000Z, 2019-09-21
// to
// datetime
// A timestamp at which to stop listing splits e.g. 2019-09-24T00:00:05.000Z, 2019-09-21