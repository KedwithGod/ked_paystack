// class to use the reusable ListDVA class function

import 'package:royal_palm_villa/Models/utilities/constants.dart';

class ListDVAReusable{
  // fetch list wrt provider slug
  listDVAByProviderSlug({required bool? active,required String? providerSlug,
  required String? currency
  })=>
      listDVA.listDVA(active: active, currency: currency,providerSlug: providerSlug);

  // fetch list based on bank id
  listDVAByBankId({required bool? active,required String? bankId,
    required String? currency
  })=>
      listDVA.listDVA(active: active, currency: currency,bankId: bankId);

  // fetch list based on customer id

  listDVAByCustomerId({required bool? active,required String? customerId,
    required String? currency
  })=>
      listDVA.listDVA(active: active, currency: currency,customerId: customerId);
}