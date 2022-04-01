import '../../models/transaction/listTransaction.dart';
import '../../utilities/constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// this class is a reusable function to display list of transaction
// by passing in different argument depending on the request list content

class TransactionList{

    // function to display the all the list of transaction
    listTransactionFunction(
   { String? status='',
    dynamic perPage='' ,// string or int
    dynamic page=1,
    dynamic amount='', // string or int
    dynamic customerId='',
    // get time in DateTime then convert it to iso8601 to fetch it from net
    //DateTime now = DateTime.now();
    // String isoDate = now.toIso8601String();
    dynamic to='',
    dynamic from=''}

        )async{

    Map<String, String> header = { 'Authorization': 'Bearer $payStackKey'};
    //var data = jsonEncode({"email": "$email", "password": "$password"});
    var url = 'https://api.paystack.co/transaction?status=$status&perPage=$perPage&page=$page&amount=$amount&customer=$customerId&to=${to==""?"":to.toIso8601String()}&from=${from==""?"":from.toIso8601String()}';
    var respond=http.get(Uri.parse(url), headers: header).then((response) {
      print('this is the list of transaction');
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      print("Response header: ${response.headers})");
      var parsed=response.body ;
      var decoded =json.decode(parsed);
      return ListOfTransactionResponse.fromJson(decoded);
    });
    respond.then((bvnResponse) {
    print(bvnResponse.status);
    print(bvnResponse.message);
    });
    return respond;
}

}