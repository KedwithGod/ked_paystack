// class to get the list of Customer in your integration based on the
// Query parameter

import 'package:royal_palm_villa/Models/utilities/constants.dart';

class CustomerList{
  // fetch customer list based no of record to display in one page
 customerListPerPage({required int? recordPerPage})=>listOfCustomer.listOfCustomer(
   recordPerPage: recordPerPage
 );
//fetch customer list by specific the page number to start fetch list from
customerListPageNumber({required int pageNumber})=>listOfCustomer.listOfCustomer(
    page: pageNumber
);
// fetch data from a specific starting date
customerListStartingDate({required DateTime startingDate})=>listOfCustomer.listOfCustomer(
    startDate: startingDate
);
// fetch data to a specific ending date
  customerListEndingDate({required DateTime endingDate})=>listOfCustomer.listOfCustomer(
      endDate: endingDate
  );
// fetch data with a two date i.e range of data, specific the date to start fetching data
  // and the date to stop
  customerListFromStartToEndDate({required DateTime startingDate,required DateTime endingDate})=>
      listOfCustomer.listOfCustomer(
      startDate: startingDate, endDate: endingDate
  );
}