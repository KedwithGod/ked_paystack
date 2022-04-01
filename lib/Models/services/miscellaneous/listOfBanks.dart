// list all the banks available for payStack integration
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:royal_palm_villa/Models/utilities/constants.dart';

import '../../models/miscellaneous/bankList.dart';

class Banks {

  /*
  // list out banks
  listOfBanks()async{
    var headers = {
      'Authorization': 'Bearer $PAYSTACK_KEY'
    };
    var request = http.MultipartRequest('GET', Uri.parse('https://api.paystack.co/bank'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map values= response.stream as Map;
      print(values.length);
    }
    else {
    print(response.reasonPhrase);
    }
  }
*/


  Future<List> listOfBanks() async {
    Map<String, String> header = { 'Authorization': 'Bearer $payStackKey'};
    //var data = jsonEncode({"email": "$email", "password": "$password"});
    var url = 'https://api.paystack.co/bank';
    var respond=http.get(Uri.parse(url), headers: header).then((response) {
      /*print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      print("Response header: ${response.headers})");*/
      var parsed=response.body ;
      var decoded =json.decode(parsed);
      print(decoded['message']);
    return decoded['data'];

    });
  return respond.then((value) => value);
  }

  /// to use this service,
/// 1. the service output a list of Map for bank data
/// 2. to user it this bank data can be thrown into a list or mapped
/// 3. then each index can be passed into the BankResponse.fromJson.name for
/// example to map out bank data

}