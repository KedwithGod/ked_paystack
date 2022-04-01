// get the total transaction performed in your account
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:royal_palm_villa/Models/models/transaction/totalTransaction.dart';
import 'package:royal_palm_villa/Models/utilities/constants.dart';

class TotalTransaction{

  // function to fetch total transaction on your integration
      totalTransactionFunction()async{
        var headers = {
          'Authorization': 'Bearer $payStackKey'
        };
        var request = http.MultipartRequest('GET', Uri.parse('https://api.paystack.co/transaction/totals'));

        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          // first convert from internalHashLink<dynamic, String> to Map<dynamic, dynamic> and parse it
          var decodedOutPut=json.decode((await response.stream.bytesToString()));
          // into initializeTransactionResponse class
          return TotalTransactionResponse.fromJson(decodedOutPut);
        }
        else {
          print(response.reasonPhrase);
        }
      }
}