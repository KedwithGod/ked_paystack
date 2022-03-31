// a class for black listing or white listing customer using risk_action
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:royal_palm_villa/Models/models/customer/whiteListBlackListCustomer.dart';
import '../../utilities/constants.dart';

class WhiteListBlackListCustomer{

  // block or allow a customer use your integration
    whiteListBlackListCustomer(
        {
        required String? customerCode,
          required String? riskAction
        }
        ) async{
      var headers = {
        'Authorization': 'Bearer $PAYSTACK_KEY',
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse('https://api.paystack.co/customer/set_risk_action'));
      request.bodyFields = {
        'customer': customerCode!,
        'risk_action': riskAction!
      };
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // first convert from internalHashLink<dynamic, String> to Map<dynamic, dynamic> and parse it
        var decodedOutPut=json.decode((await response.stream.bytesToString()));
        // into initializeTransactionResponse class
        // we will use the create customer modal class
        return WhiteListBlackListCustomerResponse.fromJson(decodedOutPut);
      }
      else {
      print(response.reasonPhrase);
      }
    }
}

///Body Param
// customer
// string
// Customer's code, or email address
// risk_action
// string
// One of the possible risk actions [ default, allow, deny ].
// allow to whitelist. deny to blacklist. Customers start with a default risk action.