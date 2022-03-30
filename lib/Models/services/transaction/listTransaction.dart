// class to display the list of transaction user has carried out
// this uses the @reusable class of TransactionList

import '../reusableServices/transactionList.dart';

class ListOfTransaction{

  // function to print out all the list of transaction
   transactionList()=>TransactionList().listTransactionFunction();

  // ...backend or admin specific request
  // function to filter list according to their status
   // use can use the status enum class to toggle the status value
  statusFilterTransactionList({required status})=>
      TransactionList().listTransactionFunction(status: status);

  // function to filter list according to customer id: that is get
   // all the transaction a customer has carried out
  //Tod: get customer id using the customer end point
  customerSpecificTransactionList({required customerId})=>
      TransactionList().listTransactionFunction(customerId:customerId);

// display all the transaction based on amount
  amountSpecificTransactionList({required amount})=>
      TransactionList().listTransactionFunction(amount: amount);

// retrieve a particular page of the transaction
  pageSpecificTransactionList({required pageNumber})=>
      TransactionList().listTransactionFunction(page:pageNumber);

  // define the number of record you want to retrieve in one page
  recordPerPageSpecificTransactionList({required recordPerPage})=>
      TransactionList().listTransactionFunction(perPage: recordPerPage);

// make sure the date is in DateTime format, using a datePicker is preferable
// or parse a string of dateTime using DateTime.parse
// display what timeStamp transaction listing should start (from)
  startDateSpecificTransactionList({required startDate})=>
      TransactionList().listTransactionFunction(from: startDate);

// display what timeStamp transaction listing should stop (to)
// if you enter date beyond the last transaction date, it will print out
// all the available transaction
  endDateSpecificTransactionList({required endDate})=>
      TransactionList().listTransactionFunction(to: endDate);

// display a specific range for transaction listing
  rangeSpecificTransactionList({required endDate,required startDate})=>
      TransactionList().listTransactionFunction(from:startDate,to: endDate);

// display the number of record per page and a specific page of transaction listing
  perPageAndPageNumberSpecificTransactionList({required pageNumber, required recordPerPage})=>
      TransactionList().listTransactionFunction(
        perPage: recordPerPage,page: pageNumber
      );

// combine all the above parameter together
// you can combine any of this two, by combining the parameter you want
  combineParameterSpecificTransactionList({
    status, customerId, transactionAmount,recordPerPage,pageNumber, startDate, endDate
  })=>
    TransactionList().listTransactionFunction(
      page: pageNumber,status: status,customerId: customerId, amount: transactionAmount,
      perPage: recordPerPage, to: endDate,from: startDate
    );


//... customer specific request
//1. display all the transaction listing for a customer using customer id
/// use the  customerSpecificTransactionList function

//2. display a particular status of transaction listing for customer using
// customer id and status param
  statusSpecificCustomerTransactionList({required status,required customerId})=>
      TransactionList().listTransactionFunction(
        status: status,customerId: customerId
      );
//3. display transaction listing for customer based on amount using
// customer id and amount param
  amountSpecificCustomerTransactionList({required amount,required customerId})=>
      TransactionList().listTransactionFunction(
          amount: amount,customerId: customerId
      );
//4. display particular page of transaction listing for customer using
// page and customer id param
  pageSpecificCustomerTransactionList({required pageNumber,required customerId})=>
      TransactionList().listTransactionFunction(
          page: pageNumber,customerId: customerId
      );
//5. define the number of record you want retrieve in one page of transaction l
// listing using customer id and perPage param
  recordPerPageSpecificCustomerTransactionList({required recordPerPage,required customerId})=>
      TransactionList().listTransactionFunction(
          perPage: recordPerPage,customerId: customerId
      );
//6. display transaction listing starting form a timeStamp using
// customer id and from param
  startDateSpecificCustomerTransactionList({required startDate,required customerId})=>
      TransactionList().listTransactionFunction(
          from: startDate,customerId: customerId
      );
//7. display transaction listing starting ending a timeStamp using
//  customer id and to param
  endDateSpecificCustomerTransactionList({required endDate,required customerId})=>
      TransactionList().listTransactionFunction(
          to: endDate,customerId: customerId
      );
//8. display the transaction list withing a range of date using the
// customer id and the to and from param
  rangeSpecificCustomerTransactionList({required startDate,required endDate,required customerId})=>
      TransactionList().listTransactionFunction(
        from: startDate,
          to: endDate,customerId: customerId
      );


}

/// this class will list of all the transaction performed
/// by the owner of the account, which will be list of dynamic object
/// to parse it into VerificationTransactionDataValue object,
/// we create a variable as thus VerificationTransactionDataValue? verificationTransactionDataValue;
/// to display information for the data at list index i
/// we set the update the above variable thus
/// verificationTransactionDataValue= VerificationTransactionDataValue.fromJson(transaction!.data![i])
/// where transaction is ListOfTransactionResponse object
/// then we can display the VerificationTransactionDataValue object from the verificationTransactionDataValue
///
/// adding query parameter
/// perPage - Specify how many records you want to retrieve per page
/// page - Specify exactly what page you want to retrieve
/// customer - Specify an ID for the customer whose transactions you want to retrieve
/// status - Filter transactions by status ('failed', 'success', 'abandoned')
/// from - A timestamp from which to start listing transaction e.g. 2016-09-24T00:00:05.000Z, 2016-09-21
/// to - A timestamp at which to stop listing transaction e.g. 2016-09-24T00:00:05.000Z, 2016-09-21
/// amount - Filter transactions by amount. Specify the amount in kobo.