import 'dart:convert';

List<ProductsModel> productsModelFromMap(String str) => List<ProductsModel>.from(json.decode(str).map((x) => ProductsModel.fromMap(x)));

String productsModelToMap(List<ProductsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ProductsModel {
  ProductsModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  factory ProductsModel.fromMap(Map<String, dynamic> json) => ProductsModel(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    price: json["price"] == null ? null : json["price"].toDouble(),
    description: json["description"] == null ? null : json["description"],
    category: json["category"] == null ? null : json["category"],
    image: json["image"] == null ? null : json["image"],
    rating: json["rating"] == null ? null : Rating.fromMap(json["rating"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "price": price == null ? null : price,
    "description": description == null ? null : description,
    "category": category == null ? null : category,
    "image": image == null ? null : image,
    "rating": rating == null ? null : rating!.toMap(),
  };
}

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  double rate;
  int count;

  factory Rating.fromMap(Map<String, dynamic> json) => Rating(
    rate: json["rate"] == null ? null : json["rate"].toDouble(),
    count: json["count"] == null ? null : json["count"],
  );

  Map<String, dynamic> toMap() => {
    "rate": rate == null ? null : rate,
    "count": count == null ? null : count,
  };
}
