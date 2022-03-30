// reusable class for fetch the list of customer in
// your integration
import 'package:royal_palm_villa/Models/models/customer/createCustomer.dart';
import 'package:royal_palm_villa/Models/models/transaction/chargeAuthorization.dart';

import '../../utilities/constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ListOfCustomer{

  // function to fetch list of customers
 Future<dynamic> listOfCustomer(
     {
  int? recordPerPage=50,
   int? page=1,
       // get time in DateTime then convert it to iso8601 to fetch it from net
       //DateTime now = DateTime.now();
       // String isoDate = now.toIso8601String();
   dynamic startDate='',
   dynamic endDate=''
}
     ) async{
    var headers = {
      'Authorization': 'Bearer $PAYSTACK_KEY',
    };
    var request = http.Request('GET', Uri.parse('https://api.paystack.co/customer?'
        'page=$page&perPage=$recordPerPage&to=${endDate==""?"":endDate.toIso8601String()}&from=${startDate==""?"":startDate.toIso8601String()}'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // first convert from internalHashLink<dynamic, String> to Map<dynamic, dynamic> and parse it
      var decodedOutPut=json.decode((await response.stream.bytesToString()));
    // into initializeTransactionResponse class
      // we will use the create customer modal class
    return CreateCustomerResponse.fromJson(decodedOutPut);
    }
    else {
    print(response.reasonPhrase);
    }
  }
  }
