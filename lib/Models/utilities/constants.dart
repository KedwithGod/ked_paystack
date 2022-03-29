// this file contains constants used in the app, i.e things initialize at the start
// of the application and does not change
import 'package:royal_palm_villa/Models/services/accountVerification/accountVerification.dart';
import 'package:royal_palm_villa/Models/services/accountVerification/bankIdentificationNumber.dart';
import 'package:royal_palm_villa/Models/services/accountVerification/bvnMatch.dart';
import 'package:royal_palm_villa/Models/services/accountVerification/resolvePhoneNumber.dart';
import 'package:royal_palm_villa/Models/services/controlPanel/fetchPaymentSession.dart';
import 'package:royal_palm_villa/Models/services/controlPanel/updatePaymentSession.dart';
import 'package:royal_palm_villa/Models/services/transaction/chargeAuthorization.dart';
import 'package:royal_palm_villa/Models/services/transaction/exportTransaction.dart';
import 'package:royal_palm_villa/Models/services/transaction/fetchTransaction.dart';
import 'package:royal_palm_villa/Models/services/transaction/initializePayment.dart';
import 'package:royal_palm_villa/Models/services/miscellaneous/listOfBanks.dart';
import 'package:royal_palm_villa/Models/services/transaction/listTransaction.dart';
import 'package:royal_palm_villa/Models/services/transaction/totalTransaction.dart';
import 'package:royal_palm_villa/Models/services/transaction/verifyTransaction.dart';
import 'package:royal_palm_villa/Models/services/transaction/viewTransactionTimeline.dart';

import '../services/accountVerification/bvnVerification.dart';



//1. colors
// a. colors for dark theme
// b. colors for light theme

//2. class instances
Banks banks=Banks();
BvnVerification bvnVerification=BvnVerification();
AccountVerification accountVerification=AccountVerification();
BINVerification binVerification =BINVerification();
ResolvePhoneNumber resolvePhoneNumber=ResolvePhoneNumber();
BVNMatch bvnMatch=BVNMatch();
PaymentSessionTimeout paymentSessionTimeout=PaymentSessionTimeout();
UpdatePaymentSessionTimeOut updatePaymentSessionTimeOut=UpdatePaymentSessionTimeOut();
InitializeTransaction initializeTransaction=InitializeTransaction();
VerifyTransaction verifyTransaction=VerifyTransaction();
ListOfTransaction listOfTransaction=ListOfTransaction();
FetchTransaction fetchTransaction=FetchTransaction();
ChargeAuthorization chargeAuthorization=ChargeAuthorization();
TotalTransaction totalTransaction=TotalTransaction();
ViewTransactionTimeLine viewTransactionTimeLine=ViewTransactionTimeLine();
ExportTransaction exportTransaction=ExportTransaction();





//3. String constants

//4. api keys
const String PAYSTACK_KEY = 'sk_test_35fcd58e67d51a0c813e2ad1bc5f5a0918fa0270';