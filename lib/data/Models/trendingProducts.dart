import 'dart:convert';

List<TrendingProducts> trendingProductsFromJson(String str) =>
    List<TrendingProducts>.from(
        json.decode(str).map((x) => TrendingProducts.fromJson(x)));

String trendingProductsToJson(List<TrendingProducts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TrendingProducts {
  int productId;
  String productName;
  String description;
  int price;
  int rating;
  int reviews;
  String imgPath;

  TrendingProducts({
    required this.productId,
    required this.productName,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.imgPath,
  });

  factory TrendingProducts.fromJson(Map<String, dynamic> json) =>
      TrendingProducts(
        productId: json["productId"],
        productName: json["productName"],
        description: json["description"],
        price: json["price"],
        rating: json["rating"],
        reviews: json["reviews"],
        imgPath: json["imgPath"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "productName": productName,
        "description": description,
        "price": price,
        "rating": rating,
        "reviews": reviews,
        "imgPath": imgPath,
      };
}
