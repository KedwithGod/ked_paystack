// how to verify if an account number actually corresponds to the bank
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/accountVerification/accountVerification.dart';
import '../../utilities/constants.dart';

// using GET request to Resolve Account Number
class AccountVerification{
  String? accountNumber;
  String? bankCode;

  AccountVerification({
    this.accountNumber,
    this.bankCode
});

  // account verification
  Future<dynamic> accountNumberVerification() async {
    Map<String, String> header = { 'Authorization': 'Bearer $payStackKey'};
    //var data = jsonEncode({"email": "$email", "password": "$password"});
    var url = 'https://api.paystack.co/bank/resolve?account_number=$accountNumber&bank_code=$bankCode';
    var respond=http.get(Uri.parse(url), headers: header).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      print("Response header: ${response.headers})");
      var parsed=response.body ;
      var decoded =json.decode(parsed);
      return AccountVerificationResponse.fromJson(decoded);
    });
    respond.then((bvnResponse) {
      print(bvnResponse.status);
      print(bvnResponse.message);
    });
    return respond;
  }
}


/// enter account number, and bank code, this can be gotten from
/// the list of bank endPoint which represent code
/// with this your can return
/// 1. account number
/// 2. account name
/// 3. bank_id
/// 4. status and message