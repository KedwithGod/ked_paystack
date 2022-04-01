// fetch customer class
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/customer/fetchCustomer.dart';
import '../../utilities/constants.dart';

class FetchCustomer{

  // function to fetch customer
  fetchCustomerDetails(
      {required String? emailOrCustomerCode}
      ) async{
    var headers = {
      'Authorization': 'Bearer $payStackKey'
    };
    var request = http.MultipartRequest('GET', Uri.parse('https://api.paystack.co/customer/$emailOrCustomerCode'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // first convert from internalHashLink<dynamic, String> to Map<dynamic, dynamic> and parse it
      var decodedOutPut=json.decode((await response.stream.bytesToString()));
      // into initializeTransactionResponse class
      // we will use the create customer modal class
      return FetchCustomerResponse.fromJson(decodedOutPut);

    }
    else {
    print(response.reasonPhrase);
    }
  }
}