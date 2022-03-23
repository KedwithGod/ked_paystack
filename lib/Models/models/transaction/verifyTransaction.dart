// account verification
import 'package:royal_palm_villa/Models/models/accountVerification/bvnMatch.dart';

class VerifyTransactionResponse {
  bool? status;
  String? message;
  VerificationTransactionDataValue? data;


  VerifyTransactionResponse({
    this.status,
    this.message,
    this.data
  });


  factory VerifyTransactionResponse.fromJson(Map<String, dynamic> json) {
    return VerifyTransactionResponse(
        status: json['status'],
        message: json['message'],
        data: VerificationTransactionDataValue(
            id: json['data']['id'] ?? 0,
            domain: json['data']['domain'] ?? '',
            status: json['data']['status'] ?? '',
            amount: json['data']['amount'] ?? 0,
            message: json['data']['message'],
            gateWayResponse: json['data']['gateway_response'] ?? '',
            paidAt: json['data']['paid_at'] ?? '',
            createdAt: json['data']['created_at'] ?? '',
            channel: json['data']['channel'] ?? '',
            plan: json['data']['plan'] ?? '',
            split: json['data']['split'] ?? '',
            orderId: json['data']['order_id'] ?? '',
            posTransactionData: json['data']['pos_transaction_data'] ?? '',
            source: json['data']['source'] ?? '',
            feesBreakDown: json['data']['fees_breakdown'] ?? '',
            transactionDate: json['data']['transaction_date'] ?? '',
            planObject: json['data']['plan_object'] ?? '',
            subAccount: json['data']['subaccount'] ?? '',
            currency: json['data']['currency'] ?? '',
            fees: json['data']['fees'] ?? 0,
            feesSplit: json['data']['fees_split'] ?? '',
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
                receiverBankAccountNumber: json['data']['authorization']['receiver_bank_account_number'] ??
                    '',
                receiverBank: json['data']['authorization']['receiver_bank'] ??
                    ''
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
                internationalFormatPhone: json['data']['customer']['international_format_phone'] ??
                    ''
            )

        )
    );
  }
}


// class model for data input
class VerificationTransactionDataValue {
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
  final Map? plan;
  final Map? split;
  final dynamic orderId;
  final String? posTransactionData;
  final dynamic source;
  final dynamic feesBreakDown;
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

  VerificationTransactionDataValue(
      {this.status, this.authorization, this.customer, this.id, this.domain, this.amount, this.message, this.gateWayResponse, this.paidAt, this.createdAt, this.channel, this.currency,
        this.ipAddress, this.metaData, this.plan, this.split,
        this.orderId, this.posTransactionData, this.source,
        this.feesBreakDown, this.transactionDate, this.planObject,
        this.subAccount, this.fees, this.feesSplit, this.log});

  factory VerificationTransactionDataValue.fromJson(Map<String, dynamic> json){
    return VerificationTransactionDataValue(
        id: json['id'] ?? 0,
        domain: json['domain'] ?? '',
        status: json['status'] ?? '',
        amount: json['amount'] ?? 0,
        message: json['message'],
        gateWayResponse: json['gateway_response'] ?? '',
        paidAt: json['paid_at'] ?? '',
        createdAt: json['created_at'] ?? '',
        channel: json['channel'] ?? '',
        plan: json['plan'] ?? {},
        split: json['split'] ?? '',
        orderId: json['order_id'] ?? '',
        posTransactionData: json['pos_transaction_data'] ?? '',
        source: json['source'] ?? '',
        feesBreakDown: json['fees_breakdown'] ?? '',
        transactionDate: json['transaction_date'] ?? '',
        planObject: json['plan_object'] ?? {},
        subAccount: json['subaccount'] ?? '',
        currency: json['currency'] ?? '',
        fees: json['fees'] ?? 0,
        feesSplit: json['fees_split'] ?? '',
        ipAddress: json['ip_address'] ?? '',
        metaData: json['metadata']==null || json['metadata']==0?MetaData():MetaData(
            displayName: json['metadata']['custom_fields'][0]['display_name'] ??
                '',
            value: json['metadata']['custom_fields'][0]['value'] ?? '',
            variableName: json['metadata']['custom_fields'][0]['variable_name'] ??
                ''
        ),
        log:  json['log']==null || json['log']==""?LogData():LogData(
          startTime: json['log']['start_time'] ?? 0,
          timeSpent: json['log']['time_spent'] ?? 0,
          attempts: json['log']['attempts'] ?? 0,
          errors: json['log']['errors'] ?? 0,
          success: json['log']['success'] ?? false,
          mobile: json['log']['mobile'] ?? false,
          input: json['log']['input'] ?? [],
          historyList: json['log']['history'] ?? [],
        ),
        authorization:json['authorization']==null|| json['authorization']==""?Authorization(): Authorization(
            authorizationCode: json['authorization']['authorization_code'] ??
                '',
            bin: json['authorization']['bin'] ?? '',
            last4digit: json['authorization']['last4'] ?? '',
            expiryMonth: json['authorization']['exp_month'] ?? '',
            expiryYear: json['authorization']['exp_year'] ?? '',
            channel: json['authorization']['channel'] ?? '',
            cardType: json['authorization']['card_type'] ?? '',
            bank: json['authorization']['bank'] ?? '',
            countryCode: json['authorization']['country_code'] ?? '',
            brand: json['authorization']['brand'] ?? '',
            reusable: json['authorization']['reusable'] ?? false,
            signature: json['authorization']['signature'] ?? '',
            accountName: json['authorization']['account_name'] ?? '',
            receiverBankAccountNumber: json['authorization']['receiver_bank_account_number'] ??
                '',
            receiverBank: json['authorization']['receiver_bank'] ?? ''
        ),
        customer:json['customer']==null|| json['customer']==""?Customer(): Customer(
            customerId: json['customer']['id'] ?? '',
            firstName: json['customer']['first_name'] ?? '',
            lastName: json['customer']['last_name'] ?? '',
            email: json['customer']['email'] ?? '',
            customerCode: json['customer']['customer_code'] ?? '',
            phone: json['customer']['phone'] ?? '',
            metaData: json['customer']['metadata'] ?? '',
            riskAction: json['customer']['risk_action'] ?? '',
            internationalFormatPhone: json['customer']['international_format_phone'] ??
                ''
        )

    )
    ;
  }


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
  final dynamic receiverBankAccountNumber;
  final dynamic receiverBank;

  Authorization({this.authorizationCode, this.bin, this.last4digit,
    this.expiryMonth, this.expiryYear, this.channel,
    this.cardType, this.bank, this.countryCode, this.brand,
    this.reusable, this.signature, this.accountName,
    this.receiverBankAccountNumber, this.receiverBank});
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

