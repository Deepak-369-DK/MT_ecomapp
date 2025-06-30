import 'dart:convert';

HomeModel homeModelFromMap(String str) => HomeModel.fromMap(json.decode(str));

String homeModelToMap(HomeModel data) => json.encode(data.toMap());

class HomeModel {
  List<Category> categories;
  List<DealOfDayProduct> dealOfDayProducts;
  List<TrendingProduct> trendingProducts;
  List<DealOfDayProduct> newArrivals;

  HomeModel({
    required this.categories,
    required this.dealOfDayProducts,
    required this.trendingProducts,
    required this.newArrivals,
  });

  factory HomeModel.fromMap(Map<String, dynamic> json) => HomeModel(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromMap(x))),
        dealOfDayProducts: List<DealOfDayProduct>.from(
            json["dealOfDayProducts"].map((x) => DealOfDayProduct.fromMap(x))),
        trendingProducts: List<TrendingProduct>.from(
            json["trendingProducts"].map((x) => TrendingProduct.fromMap(x))),
        newArrivals: List<DealOfDayProduct>.from(
            json["newArrivals"].map((x) => DealOfDayProduct.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toMap())),
        "dealOfDayProducts":
            List<dynamic>.from(dealOfDayProducts.map((x) => x.toMap())),
        "trendingProducts":
            List<dynamic>.from(trendingProducts.map((x) => x.toMap())),
        "newArrivals": List<dynamic>.from(newArrivals.map((x) => x.toMap())),
      };
}

class Category {
  String name;
  String image;

  Category({
    required this.name,
    required this.image,
  });

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "image": image,
      };
}

class DealOfDayProduct {
  String title;
  String desc;
  String price;
  String? oldPrice;
  String? discount;
  String image;
  double rating;
  int reviewCount;

  DealOfDayProduct({
    required this.title,
    required this.desc,
    required this.price,
    this.oldPrice,
    this.discount,
    required this.image,
    required this.rating,
    required this.reviewCount,
  });

  factory DealOfDayProduct.fromMap(Map<String, dynamic> json) =>
      DealOfDayProduct(
        title: json["title"],
        desc: json["desc"],
        price: json["price"],
        oldPrice: json["oldPrice"],
        discount: json["discount"],
        image: json["image"],
        rating: json["rating"]?.toDouble(),
        reviewCount: json["reviewCount"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "desc": desc,
        "price": price,
        "oldPrice": oldPrice,
        "discount": discount,
        "image": image,
        "rating": rating,
        "reviewCount": reviewCount,
      };
}

class TrendingProduct {
  String title;
  String price;
  String oldPrice;
  String discount;
  String image;

  TrendingProduct({
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
  });

  factory TrendingProduct.fromMap(Map<String, dynamic> json) => TrendingProduct(
        title: json["title"],
        price: json["price"],
        oldPrice: json["oldPrice"],
        discount: json["discount"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "price": price,
        "oldPrice": oldPrice,
        "discount": discount,
        "image": image,
      };
}
