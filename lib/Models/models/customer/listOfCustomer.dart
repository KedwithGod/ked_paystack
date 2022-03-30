// modal class to fetch the list of customer data
class ListOfCustomerResponse{
  bool? status;
  String? message;
  List<Map>? data;

  ListOfCustomerResponse({this.data,this.message,this.status});

  factory ListOfCustomerResponse.fromJson(Map json){
    return ListOfCustomerResponse(
      status: json['status'],
      message: json['message'],
      data: json['data']
        // to refactor the date, you can use the CreateCustomerResponse
      // model class, it has the same date structure as the Map gotten from the
      // data above, just pass the data a listViewBuilder and use pass each
      // individual list item into the CreateCustomerResponse.fromJson
    );
  }
}