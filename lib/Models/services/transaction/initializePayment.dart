// dart class to initialize payment in paystack
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:royal_palm_villa/Models/models/transaction/initializeTransaction.dart';
import 'package:royal_palm_villa/Models/utilities/constants.dart';

class InitializeTransaction{





  // initialize payment
  initializePayment(
  {required String? amount,
  required String? email,
    String? reference,
  String? callbackUrl,
  String? plan,
  String? invoiceLimit,
  String? subAccount,
  String? transactionCharge,
  String? bearer,
  List<String>? channels,}

      ) async{
    var headers = {
      'Authorization': 'Bearer $payStackKey',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('https://api.paystack.co/transaction/initialize'));
    request.body = json.encode({
      "email": email,
      "amount": amount,
      "reference": reference,
      "bearer":bearer,
      "callback_url":callbackUrl,
      "plan":plan,
      "invoice_limit":invoiceLimit,
      "subaccount":subAccount,
      "transaction_charge":transactionCharge,
      "channels":channels ?? ["cards","banks"],
      "metadata": {
        "custom_fields": [
          {
            "display_name": "Mobile Number",
            "variable_name": "mobile_number",
            "value": "+2348012345678"
          }
        ]
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // first convert from internalHashLink<dynamic, String> to Map<dynamic, dynamic> and parse it
      var decodedOutPut=json.decode((await response.stream.bytesToString()));
      // into initializeTransactionResponse class
      return InitializeTransactionResponse.fromJson(decodedOutPut);
    }
    else {
    print(response.reasonPhrase);
    }
  }


}

// details of the variable pasted above
/*
#amount (required) - Amount in kobo
#email (required) - Customer's email address
#reference - Generate a reference or leave this param blank for Paystack to generate one for you
#callback_url - Overrides the callback URL set on Paystack dashboard.
#plan - If transaction is to create a subscription to a predefined plan, provide plan code here. This would invalidate the value provided in amount
#invoice_limit - Number of times to charge customer during subscription to plan
#metadata - Stringified JSON object. Add a custom_fields attribute which has an array of objects if you would like the fields to be added to your transaction when displayed on the dashboard.
#subaccount - The code for the subaccount that owns the payment.
#transaction_charge - A flat fee to charge the subaccount for this transaction, in kobo. This overrides the split percentage set when the subaccount was created. Ideally, you will need to use this if you are splitting in flat rates (since subaccount creation only allows for percentage split).
#bearer - Who bears Paystack charges? account or subaccount (defaults to account).
#channels - Send us 'card' or 'bank' or 'card','bank' as an array to specify what options to show the user paying
*/