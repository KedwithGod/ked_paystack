// class to validate customer using customer details
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:royal_palm_villa/Models/models/customer/validateCustomer.dart';
import '../../utilities/constants.dart';

class ValidateCustomer {
  // function to validate validate cusomer
  Future validateCustomer({
    required String? customerCode,
    required String? country,
    required String? type,
    required String? accountNumber,
    required String? bvn,
    required String? bankCode,
    required String? firstName,
    required String? lastName

  }) async {
    var headers = {'Authorization': 'Bearer $payStackKey'};
    var request = http.Request(
        'POST',
        Uri.parse(
            ' https://api.paystack.co/customer/$customerCode/identification'));
    request.bodyFields = {
      "country": country!,
      "type": type!,
      "account_number":accountNumber!,
      "bvn": bvn!,
      "bank_code": bankCode!,
      "first_name": firstName!,
      "last_name": lastName!
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
// first convert from internalHashLink<dynamic, String> to Map<dynamic, dynamic> and parse it
      var decodedOutPut = json.decode((await response.stream.bytesToString()));
// into initializeTransactionResponse class
// we will use the create customer modal class
      return ValidateCustomerResponse.fromJson(decodedOutPut);
    } else {
      print(response.reasonPhrase);
    }
  }
}

///Body Param
// first_name
// string
// Customer's first name
// last_name
// string
// Customer's last name
// type
// string
// Predefined types of identification. Valid values: bvn, bank_account
// value
// string
// Customer's identification number
// country
// string
// 2 letter country code of identification issuer
// bvn
// string
// Customer's Bank Verification Number
// bank_code
// string
// You can get the list of Bank Codes by calling the List Banks endpoint. (required if type is bank_account)
// account_number
// string
// Customer's bank account number. (required if type is bank_account)