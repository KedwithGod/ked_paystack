// partial debit to charge customer partially

class PartialDebitResponse{


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