// list of request on the list and search split reusable service class


import 'package:royal_palm_villa/Models/utilities/constants.dart';

// fetch list by name
listSearchSplitByNameParam({required String name})=>listSearchSplit.listSearchSplit(
  name: name
);

// fetch list by active status
listSearchSplitByActiveParam({required bool active})=>listSearchSplit.listSearchSplit(
    active: active
);
// fetch list by page number
listSearchSplitByPageNumberParam({required int pageNumber})=>listSearchSplit.listSearchSplit(
    page: pageNumber
);

// specify the number of record per page
listSearchSplitByRecordPerPageParam({required int recordPerPage})=>listSearchSplit.listSearchSplit(
    perPage: recordPerPage
);
// specify sort by
listSearchSplitBySortByParam({required int sortBy})=>listSearchSplit.listSearchSplit(
      sortBy: sortBy
);
// specify starting Date for fetching record
listSearchSplitByStartDateParam({required DateTime startDate})=>listSearchSplit.listSearchSplit(
    from: startDate
);

// specify end date for fetching record
listSearchSplitByEndDateParam({required DateTime endDate})=>listSearchSplit.listSearchSplit(
    to: endDate
);
// specify range for fetching record
listSearchSplitByRange({required DateTime startDate,required DateTime endDate})=>listSearchSplit.listSearchSplit(
    to: endDate,from: startDate
);

// when you want to combine the whole parameter together

listSearchSplitAllParam({required String name, required DateTime startDate,
  required DateTime endDate,required int recordPerPage, required bool active,
  required int pageNumber,
  required int sortBy})=>listSearchSplit.listSearchSplit(
    to: endDate,from: startDate,name: name, active: active
    ,page: pageNumber, perPage: recordPerPage, sortBy: sortBy
);
///Query Param
// name
// string
// The name of the split
// active
// boolean
// Any of true or false
// sort_by
// string
// Sort by name, defaults to createdAt date
// perPage
// integer
// Number of splits per page. If not specify we use a default value of 50.
// page
// integer
// Page number to view. If not specify we use a default value of 1.
// from
// datetime
// A timestamp from which to start listing splits e.g. 2019-09-24T00:00:05.000Z, 2019-09-21
// to
// datetime
