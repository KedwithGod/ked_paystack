// function to update customer detail in your payStack integration
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:royal_palm_villa/Models/models/customer/updateCustomer.dart';
import '../../models/customer/fetchCustomer.dart';
import '../../utilities/constants.dart';

class UpdateCustomer{

  // function to update customer
 Future updateCustomer(
     {
  required dynamic idOrCustomerCode, // id is int, customerCode is in String
       required String? firstName,required String? lastName,
       String? email,
       String? phone,
       Map? metaData //A set of key/value pairs that you can attach to the customer.
       // It can be used to store additional information in a structured format.

}
     ) async{
    var headers = {
      'Authorization': 'Bearer $PAYSTACK_KEY',
      'Content-Type': 'application/json'
    };
    var request = http.Request('PUT', Uri.parse('https://api.paystack.co/customer/$idOrCustomerCode'));
    request.bodyFields = {
      if(email!=null)'email': email,
      if(phone!=null)"phone":phone,
      "first_name":firstName!,
      "last_name":lastName!,
      if(metaData!=null)"metadata":"$metaData"
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // first convert from internalHashLink<dynamic, String> to Map<dynamic, dynamic> and parse it
      var decodedOutPut=json.decode((await response.stream.bytesToString()));
      // into initializeTransactionResponse class
      // we will use the create customer modal class
      return UpdateCustomerResponse.fromJson(decodedOutPut);
    }
    else {
    print(response.reasonPhrase);
    }
  }
}