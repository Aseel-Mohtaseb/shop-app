class SearchModel
{
  late bool status;
  String? message;
  late Data data;

  SearchModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  late int currentPage;
  List<Product> data = [];
  late String firstPageUrl;
  int? from;
  int? lastPage;
  late String lastPageUrl;
  String? nextPageUrl;
  late String path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  late int total;

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
      json['data'].forEach((v) {
        data.add(Product.fromJson(v));
      });
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
}

class Product {
  late int id;
  late dynamic price;
  dynamic oldPrice;
  int? discount;
  late String image;
  late String name;
  late String description;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

}