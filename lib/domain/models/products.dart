import 'dart:ffi';

import 'package:apps/domain/models/rating.dart';

class Products {
 final int id;
 final  String title;
 final  double price;
 final String description;
 final String category;
 final String image;
 final Rating rating;

 Products({
   required this.id,
   required this.title,
   required this.price,
   required this.description,
   required this.category,
   required this.image,
   required this.rating,
 });

 factory Products.fromJson(Map<String, dynamic> json) {
   return Products(
     id: json['id'],
     title: json['title'],
     price: json['price'].toDouble(),
     description: json['description'],
     category: json['category'],
     image: json['image'],
     rating: Rating.fromJson(json['rating']),
   );
 }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    return data;
  }
}