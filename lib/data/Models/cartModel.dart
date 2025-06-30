import 'dart:convert';

List<Cartmodel> cartmodelFromMap(String str) =>
    List<Cartmodel>.from(json.decode(str).map((x) => Cartmodel.fromMap(x)));

String cartmodelToMap(List<Cartmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Cartmodel {
  String productId;
  String productName;
  String description;
  double price;
  String rating;
  String reviews;
  String discPer;
  String oldPrice;
  String qty;
  String size;
  String imgPath;

  Cartmodel({
    required this.productId,
    required this.productName,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.discPer,
    required this.oldPrice,
    required this.qty,
    required this.size,
    required this.imgPath,
  });

  factory Cartmodel.fromMap(Map<String, dynamic> json) => Cartmodel(
        productId: json["productId"],
        productName: json["productName"],
        description: json["description"],
        price: json["price"],
        rating: json["rating"],
        reviews: json["reviews"],
        discPer: json["discPer"],
        oldPrice: json["oldPrice"],
        qty: json["qty"],
        size: json["size"],
        imgPath: json["imgPath"],
      );

  Map<String, dynamic> toMap() => {
        "productId": productId,
        "productName": productName,
        "description": description,
        "price": price,
        "rating": rating,
        "reviews": reviews,
        "discPer": discPer,
        "oldPrice": oldPrice,
        "qty": qty,
        "size": size,
        "imgPath": imgPath,
      };
}
