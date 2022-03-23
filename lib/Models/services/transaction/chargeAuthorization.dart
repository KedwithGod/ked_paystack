// function to charge a transaction with reusable set to true in the authorization
import 'package:royal_palm_villa/Models/models/transaction/chargeAuthorization.dart';

import '../../utilities/constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ChargeAuthorization{

  // function to charge transaction
  chargeAuthorizationFunction() async{
    var headers = {
      'Authorization': 'Bearer $PAYSTACK_KEY',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('https://api.paystack.co/transaction/charge_authorization'));
    request.bodyFields ={ "email": "customer@email.com", "amount": "20000", "authorization_code": "AUTH_oltbz85v5p" };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // first convert from internalHashLink<dynamic, String> to Map<dynamic, dynamic> and parse it
      var decodedOutPut=json.decode((await response.stream.bytesToString()));
    // into initializeTransactionResponse class
    return ChargeAuthorizationResponse.fromJson(decodedOutPut);
    }
    else {
    print(response.reasonPhrase);
    }
  }
}

///Body Param
///required
// amount
// (string)
// Amount should be in kobo if currency is NGN, pesewas, if currency is GHS, and cents, if currency is ZAR

// email
// (string)
// Customer's email address

// authorization_code
// (string)
// Valid authorization code to charge

///optional
// reference
// (string)
// Unique transaction reference. Only -, ., = and alphanumeric characters allowed.

// currency
// (string)
// Currency in which amount should be charged. Allowed values are: NGN, GHS, ZAR or USD

// metadata
// (string)
// Stringified JSON object. Add a custom_fields attribute which has an array of
// objects if you would like the fields to be added to your transaction when
// displayed on the dashboard. Sample: {"custom_fields":[{"display_name":"Cart ID",
// "variable_name": "cart_id","value": "8393"}]}

// channels
// (array)
// Send us 'card' or 'bank' or 'card','bank' as an array to specify what options to show the user paying

// subaccount
// (string)
// The code for the subaccount that owns the payment. e.g. ACCT_8f4s1eq7ml6rlzj

// transaction_charge
// (integer)
// A flat fee to charge the subaccount for this transaction (in kobo if currency
// is NGN, pesewas, if currency is GHS, and cents, if currency is ZAR). This overrides
// the split percentage set when the subaccount was created. Ideally, you will
// need to use this if you are splitting in flat rates (since subaccount creation
// only allows for percentage split). e.g. 7000 for a 70 naira flat fee.

// bearer
// (string)
// Who bears Paystack charges? account or subaccount (defaults to account).

// queue
// (boolean)
// If you are making a scheduled charge call, it is a good idea to queue them so the processing system does not get overloaded causing transaction processing errors. Send queue:true to take advantage of our queued charging.