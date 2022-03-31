// modal class to fetch the list of customer data
class ListOfCustomerResponse{
  bool? status;
  String? message;
  List<Map>? data;
  ListOfCustomerMeta? meta;
  ListOfCustomerResponse({this.data,this.message,this.status, this.meta});

  factory ListOfCustomerResponse.fromJson(Map json){
    return ListOfCustomerResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'],
        meta: ListOfCustomerMeta(
          total:json['meta']['total'],
            skipped:json['meta']['skipped'],
            perPage:json['meta']['perPage'],
            page:json['meta']['page'],
            pageCount:json['meta']['pageCount'],
        )
        // to refactor the date, you can use the CreateCustomerResponse
      // model class, it has the same date structure as the Map gotten from the
      // data above, just pass the data a listViewBuilder and use pass each
      // individual list item into the CreateCustomerResponse.fromJson
    );
  }
}

class ListOfCustomerMeta {
  int? total,
  skipped,
  perPage,
  page,
  pageCount;
  ListOfCustomerMeta({this.perPage, this.page,this.total,
    this.skipped, this.pageCount
  });

}