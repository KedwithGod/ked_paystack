// model for charge authorization 

class ChargeAuthorizationResponse {
  bool? status;
  String? message;
  DataValue? data;

  ChargeAuthorizationResponse({
    this.status,
    this.message,
    this.data
  });


  factory ChargeAuthorizationResponse.fromJson(Map<String, dynamic> json) {
    return ChargeAuthorizationResponse(
        status: json['status'],
        message: json['message'],
        data: DataValue(
            id: json['data']['id'] ?? 0,
            domain: json['data']['domain'] ?? '',
            status: json['data']['status'] ?? '',
            amount: json['data']['amount'] ?? 0,
            message: json['data']['message'],
            gateWayResponse: json['data']['gateway_response'] ?? '',
            paidAt: json['data']['paid_at'] ?? '',
            createdAt: json['data']['created_at'] ?? '',
            channel: json['data']['channel'] ?? '',
            source: json['data']['source'] ?? '',
            currency: json['data']['currency'] ?? '',
            fees: json['data']['fees'] ?? 0,
            ipAddress: json['data']['ip_address'] ?? '',
            metaData:json['metadata']==null || json['metadata']==0|| json['metadata']==""?MetaData(): MetaData(
                displayName: json['data']['metadata']['custom_fields'][0]['display_name'] ??
                    '',
                value: json['data']['metadata']['custom_fields'][0]['value'] ??
                    '',
                variableName: json['data']['metadata']['custom_fields'][0]['variable_name'] ??
                    ''
            ),
            log: json['log']==null || json['log']==""?LogData(): LogData(
              startTime: json['data']['log']['start_time'] ?? 0,
              timeSpent: json['data']['log']['time_spent'] ?? 0,
              attempts: json['data']['log']['attempts'] ?? 0,
              errors: json['data']['log']['errors'] ?? 0,
              success: json['data']['log']['success'] ?? false,
              mobile: json['data']['log']['mobile'] ?? false,
              input: json['data']['log']['input'] ?? [],
              historyList: json['data']['log']['history'] ?? [],
            ),
            authorization:json['authorization']==null|| json['authorization']==""?Authorization(): Authorization(
                authorizationCode: json['data']['authorization']['authorization_code'] ??
                    '',
                bin: json['data']['authorization']['bin'] ?? '',
                last4digit: json['data']['authorization']['last4'] ?? '',
                expiryMonth: json['data']['authorization']['exp_month'] ?? '',
                expiryYear: json['data']['authorization']['exp_year'] ?? '',
                channel: json['data']['authorization']['channel'] ?? '',
                cardType: json['data']['authorization']['card_type'] ?? '',
                bank: json['data']['authorization']['bank'] ?? '',
                countryCode: json['data']['authorization']['country_code'] ??
                    '',
                brand: json['data']['authorization']['brand'] ?? '',
                reusable: json['data']['authorization']['reusable'] ?? false,
                signature: json['data']['authorization']['signature'] ?? '',
                accountName: json['data']['authorization']['account_name'] ??
                    '',
            ),
            customer:json['customer']==null|| json['customer']==""?Customer(): Customer(
                customerId: json['data']['customer']['id'] ?? '',
                firstName: json['data']['customer']['first_name'] ?? '',
                lastName: json['data']['customer']['last_name'] ?? '',
                email: json['data']['customer']['email'] ?? '',
                customerCode: json['data']['customer']['customer_code'] ?? '',
                phone: json['data']['customer']['phone'] ?? '',
                metaData: json['data']['customer']['metadata'] ?? '',
                riskAction: json['data']['customer']['risk_action'] ?? '',
            )

        )
    );
  }
}
  class DataValue {
  final int? id;
  final String? domain;
  final int? amount;
  final String? status;
  final String? message;
  final String? gateWayResponse;
  final String? paidAt; // time in ISO8601 format
  // YYYY-MM-DD'T'hh:mm:ss.sTZD (e.g. 2015-12-11T20:28:30.45+01:00 or 2015-12-11T19:28:30.45Z)

  final String? createdAt; // time in ISO8601 format
  // YYYY-MM-DD'T'hh:mm:ss.sTZD (e.g. 2015-12-11T20:28:30.45+01:00 or 2015-12-11T19:28:30.45Z)

  final String? channel; // payment channel either bank, card or ussd
  final String? currency;
  final String? ipAddress;
  final dynamic source;
  final dynamic fees;
  final MetaData? metaData;
  final LogData? log;
  final Authorization? authorization;
  final Customer? customer;

  DataValue(
  {this.status, this.authorization, this.customer, this.id, this.domain, this.amount, this.message, this.gateWayResponse, this.paidAt, this.createdAt, this.channel, this.currency,
  this.ipAddress, this.metaData,this.source,
  this.fees, this.log});
  }



class Customer {
  final int? customerId;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? customerCode;
  final String? phone;
  final dynamic metaData;
  final String? riskAction;

  Customer({this.customerId, this.firstName,
    this.lastName, this.email, this.customerCode,
    this.phone, this.metaData, this.riskAction,
    });
}

class Authorization {
  final String? authorizationCode;
  final String? bin; // bank identification number
  final String? last4digit;
  final String? expiryMonth;
  final String? expiryYear;
  final String? channel; // such as card, bank or ussd
  final String? cardType;
  final String? bank;
  final String? countryCode;
  final String? brand;
  final bool? reusable;
  final String? signature;
  final dynamic accountName;


  Authorization({this.authorizationCode, this.bin, this.last4digit,
    this.expiryMonth, this.expiryYear, this.channel,
    this.cardType, this.bank, this.countryCode, this.brand,
    this.reusable, this.signature, this.accountName,
    });
}

class LogData {
  final int? startTime; // seems this is in seconds
  final int? timeSpent; // seems this is in seconds
  final int? attempts;
  final int? errors;
  final bool? success;
  final bool? mobile;
  final List? input;
  final List? historyList;

  LogData({this.historyList, this.startTime, this.timeSpent,
    this.attempts, this.errors, this.success,
    this.mobile, this.input,});
}

// this will be used to output the history List, when you want
// to output it with this format
// "type": "action",
// "message": "Set payment method to: bank",
// "time": 13
class History {
  final String? type;
  final String? message;
  final String? time;

  History({this.type, this.message, this.time});

}

class MetaData {
  String? displayName;
  String? variableName;
  String? value; // this shows the value of the variable above

  MetaData({this.displayName,
    this.variableName,
    this.value});

}

///{
//   "status": true,
//   "message": "Charge attempted",
//   "data": {
//     "amount": 27000,
//     "currency": "NGN",
//     "transaction_date": "2020-05-27T11:45:03.000Z",
//     "status": "success",
//     "reference": "cn65lf4ixmkzvda",
//     "domain": "test",
//     "metadata": "",
//     "gateway_response": "Approved",
//     "message": null,
//     "channel": "card",
//     "ip_address": null,
//     "log": null,
//     "fees": 14500,
//     "authorization": {
//       "authorization_code": "AUTH_pmx3mgawyd",
//       "bin": "408408",
//       "last4": "4081",
//       "exp_month": "12",
//       "exp_year": "2020",
//       "channel": "card",
//       "card_type": "visa DEBIT",
//       "bank": "Test Bank",
//       "country_code": "NG",
//       "brand": "visa",
//       "reusable": true,
//       "signature": "SIG_2Gvc6pNuzJmj4TCchXfp",
//       "account_name": null
//     },
//     "customer": {
//       "id": 23215815,
//       "first_name": null,
//       "last_name": null,
//       "email": "mail@mail.com",
//       "customer_code": "CUS_wt0zmhzb0xqd4nr",
//       "phone": null,
//       "metadata": null,
//       "risk_action": "default"
//     },
//     "plan": null,
//     "id": 696105928
//   }
// }

