// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  String name;
  String image;
  int price;
  String description;
  String brand;
  Category category;
  int countInStock;
  double rating;
  int numReviews;
  String? coverImage;

  User({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.brand,
    required this.category,
    required this.countInStock,
    required this.rating,
    required this.numReviews,
    this.coverImage,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    image: json["image"],
    price: json["price"],
    description: json["description"],
    brand: json["brand"],
    category: categoryValues.map[json["category"]]!,
    countInStock: json["countInStock"],
    rating: json["rating"]?.toDouble(),
    numReviews: json["numReviews"],
    coverImage: json["coverImage"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "price": price,
    "description": description,
    "brand": brand,
    "category": categoryValues.reverse[category],
    "countInStock": countInStock,
    "rating": rating,
    "numReviews": numReviews,
    "coverImage": coverImage,
  };
}

enum Category {
  BOOTS,
  SLIDES,
  SNEAKERS
}

final categoryValues = EnumValues({
  "Boots": Category.BOOTS,
  "Slides": Category.SLIDES,
  "Sneakers": Category.SNEAKERS
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
