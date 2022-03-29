// partial debit to charge customer partially

class PartialDebitResponse{

  bool? status;
  String? message;
  PartialDebitData? data;


  PartialDebitResponse({
    this.status,
    this.message,
    this.data
  });

  factory PartialDebitResponse.fromJson(Map<String, dynamic> json) {
    return PartialDebitResponse(
        status: json['status'],
        message: json['message'],
        data: PartialDebitData(
            id: json['data']['id'] ?? 0,
            domain: json['data']['domain'] ?? '',
            status: json['data']['status'] ?? '',
            amount: json['data']['amount'] ?? 0,
            message: json['data']['message'],
            gateWayResponse: json['data']['gateway_response'] ?? '',
            channel: json['data']['channel'] ?? '',
            plan: json['data']['plan'] ?? '',
            transactionDate: json['data']['transaction_date'] ?? '',
            reference: json['data']['reference'] ?? '',
            currency: json['data']['currency'] ?? '',
            fees: json['data']['fees'] ?? 0,
            ipAddress: json['data']['ip_address'] ?? '',
            metaData:json['metadata']==null || json['metadata']==0?MetaData(): MetaData(
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

class PartialDebitData {
  final int? id;
  final String? domain;
  final int? amount;
  final String? status;
  final String? message;
  final String? gateWayResponse;
 // time in ISO8601 format
  // YYYY-MM-DD'T'hh:mm:ss.sTZD (e.g. 2015-12-11T20:28:30.45+01:00 or 2015-12-11T19:28:30.45Z)
// time in ISO8601 format
  // YYYY-MM-DD'T'hh:mm:ss.sTZD (e.g. 2015-12-11T20:28:30.45+01:00 or 2015-12-11T19:28:30.45Z)

  final String? channel; // payment channel either bank, card or ussd
  final String? currency;
  final String? ipAddress;
  final Map? plan;
  final String? reference;
  final String? transactionDate; // time in ISO8601 format
  // YYYY-MM-DD'T'hh:mm:ss.sTZD (e.g. 2015-12-11T20:28:30.45+01:00 or 2015-12-11T19:28:30.45Z)

  final dynamic planObject;
  final Map? subAccount;
  final int? fees;
  final dynamic feesSplit;
  final MetaData? metaData;
  final LogData? log;
  final Authorization? authorization;
  final Customer? customer;

  PartialDebitData(
      {this.id,
      this.domain,
      this.amount,
      this.status,
      this.message,
      this.gateWayResponse,
      this.channel,
      this.currency,
      this.ipAddress,
      this.plan,
      this.reference,
      this.transactionDate,
      this.planObject,
      this.subAccount,
      this.fees,
      this.feesSplit,
      this.metaData,
      this.log,
      this.authorization,
      this.customer});
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

class Customer {
  final int? customerId;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? customerCode;
  final String? phone;
  final dynamic metaData;
  final String? riskAction;
  final dynamic internationalFormatPhone;

  Customer({this.customerId, this.firstName,
    this.lastName, this.email, this.customerCode,
    this.phone, this.metaData, this.riskAction,
    this.internationalFormatPhone});
}

class MetaData{
  String? displayName;
  String? variableName;
  String? value; // this shows the value of the variable above

  MetaData({this.displayName,
    this.variableName,
    this.value});
}

/// response of data
/// {
//   "status": true,
//   "message": "Charge attempted",
//   "data": {
//     "amount": 2000,
//     "currency": "NGN",
//     "transaction_date": "2020-01-23T14:39:37.000Z",
//     "status": "success",
//     "reference": "REF_0000000001",
//     "domain": "test",
//     "metadata": "",
//     "gateway_response": "Approved",
//     "message": null,
//     "channel": "card",
//     "ip_address": null,
//     "log": null,
//     "fees": 30,
//     "authorization": {
//       "authorization_code": "AUTH_72btv547",
//       "bin": "408408",
//       "last4": "0409",
//       "exp_month": "12",
//       "exp_year": "2020",
//       "channel": "card",
//       "card_type": "visa DEBIT",
//       "bank": "Test Bank",
//       "country_code": "NG",
//       "brand": "visa",
//       "reusable": true,
//       "signature": "SIG_GfJIf2Dg1N1BwN5ddXmh",
//       "account_name": "BoJack Horseman"
//     },
//     "customer": {
//       "id": 16702,
//       "first_name": "",
//       "last_name": "",
//       "email": "customer@email.com",
//       "customer_code": "CUS_096t7vsogztygg4",
//       "phone": "",
//       "metadata": null,
//       "risk_action": "default"
//     },
//     "plan": 0,
//     "amount": 2000
//   }
// }