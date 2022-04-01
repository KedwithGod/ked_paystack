// this file contains constants used in the app, i.e things initialize at the start
// of the application and does not change
import 'package:royal_palm_villa/Models/services/accountVerification/accountVerification.dart';
import 'package:royal_palm_villa/Models/services/accountVerification/bankIdentificationNumber.dart';
import 'package:royal_palm_villa/Models/services/accountVerification/bvnMatch.dart';
import 'package:royal_palm_villa/Models/services/accountVerification/resolvePhoneNumber.dart';
import 'package:royal_palm_villa/Models/services/controlPanel/fetchPaymentSession.dart';
import 'package:royal_palm_villa/Models/services/controlPanel/updatePaymentSession.dart';
import 'package:royal_palm_villa/Models/services/customer/createCustomer.dart';
import 'package:royal_palm_villa/Models/services/customer/updateCustomer.dart';
import 'package:royal_palm_villa/Models/services/customer/validateCustomer.dart';
import 'package:royal_palm_villa/Models/services/customer/whiteListBlackListCustomer.dart';
import 'package:royal_palm_villa/Models/services/dedicatedVirtualAccount/createDVA.dart';
import 'package:royal_palm_villa/Models/services/dedicatedVirtualAccount/deActivateDVA.dart';
import 'package:royal_palm_villa/Models/services/dedicatedVirtualAccount/fetchDVA.dart';
import 'package:royal_palm_villa/Models/services/dedicatedVirtualAccount/listDVA.dart';
import 'package:royal_palm_villa/Models/services/dedicatedVirtualAccount/splitDVA.dart';
import 'package:royal_palm_villa/Models/services/miscellaneous/listOfBanks.dart';
import 'package:royal_palm_villa/Models/services/reusableServices/listAndSearchSplit.dart';
import 'package:royal_palm_villa/Models/services/reusableServices/listCustomer.dart';
import 'package:royal_palm_villa/Models/services/transaction/chargeAuthorization.dart';
import 'package:royal_palm_villa/Models/services/transaction/exportTransaction.dart';
import 'package:royal_palm_villa/Models/services/transaction/fetchTransaction.dart';
import 'package:royal_palm_villa/Models/services/transaction/initializePayment.dart';
import 'package:royal_palm_villa/Models/services/transaction/listTransaction.dart';
import 'package:royal_palm_villa/Models/services/transaction/partialDebit.dart';
import 'package:royal_palm_villa/Models/services/transaction/totalTransaction.dart';
import 'package:royal_palm_villa/Models/services/transaction/verifyTransaction.dart';
import 'package:royal_palm_villa/Models/services/transaction/viewTransactionTimeline.dart';
import 'package:royal_palm_villa/Models/services/transactionSplit/addUpdateSplitSubAccount.dart';
import 'package:royal_palm_villa/Models/services/transactionSplit/createSplit.dart';
import 'package:royal_palm_villa/Models/services/transactionSplit/fetchSplitTransaction.dart';
import 'package:royal_palm_villa/Models/services/transactionSplit/removeSubAccount.dart';
import 'package:royal_palm_villa/Models/services/transactionSplit/updateSplitTransaction.dart';
import '../services/accountVerification/bvnVerification.dart';
import '../services/customer/fetchCustomer.dart';
import '../services/reusableServices/listDVA.dart';



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
PartialDebit partialDebit=PartialDebit();
ListSearchSplit listSearchSplit=ListSearchSplit();
FetchSplitTransaction fetchSplitTransaction=FetchSplitTransaction();
UpdateSplitTransaction updateSplitTransaction=UpdateSplitTransaction();
AddUpdateSplitSubAccount addUpdateSplitSubAccount=AddUpdateSplitSubAccount();
RemoveSubAccount removeSubAccount=RemoveSubAccount();
CreateSplit createSplit=CreateSplit();
CreateCustomer createCustomer=CreateCustomer();
ListOfCustomer listOfCustomer =ListOfCustomer();
FetchCustomer fetchCustomer=FetchCustomer();
UpdateCustomer updateCustomer=UpdateCustomer();
ValidateCustomer validateCustomer=ValidateCustomer();
WhiteListBlackListCustomer whiteListBlackListCustomer=WhiteListBlackListCustomer();
CreateDVA createDVA=CreateDVA();
ListDVA listDVA =ListDVA();
ListDVAReusable listDVAReusable=ListDVAReusable();
FetchDVA fetchDVA=FetchDVA();
DeActivateDVA deActivateDVA=DeActivateDVA();
SplitDVA splitDVA=SplitDVA();



//3. String constants

//4. api keys
const String payStackKey = 'sk_test_35fcd58e67d51a0c813e2ad1bc5f5a0918fa0270';