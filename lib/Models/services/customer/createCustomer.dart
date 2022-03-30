// service to create a customer account
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:royal_palm_villa/Models/models/customer/createCustomer.dart';
import 'package:royal_palm_villa/Models/models/transactionSplit/createSplit.dart';
import '../../utilities/constants.dart';

class CreateCustomer {
  // function to create a customer
  Future<dynamic> createCustomer(
      {String? email,
      String? firstName,
      String? lastName,
      String? phone,
        // you can add additional data for customer care e.g dob,
        //town, location and other info you need to get from the customer
      Map? metaData}) async {
    Map<String, String> header = {
      'Authorization': 'Bearer $PAYSTACK_KEY',
      "Content-Type": "application/json"
    };
    Map data = {
      if (email != null) "email": email,
      if (firstName != null) "first_name": firstName,
      if (lastName != null) "last_name": lastName,
      if (phone != null) "phone": phone,
      if(metaData!=null)'metadata':metaData
    };
    var url = 'https://api.paystack.co/customer';
    var respond =
        http.post(Uri.parse(url), headers: header, body: data).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      print("Response header: ${response.headers})");
      var parsed = response.body;
      var decoded = json.decode(parsed);
      return CreateCustomerResponse.fromJson(decoded);
    });
    respond.then((createCustomer) {
      print(createCustomer.status);
      print(createCustomer.message);
    });
    return respond;
  }
}
