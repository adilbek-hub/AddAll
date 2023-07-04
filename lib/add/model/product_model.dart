import 'dart:convert';

class Product {
  const Product(
      {this.image,
      required this.title,
      required this.description,
      required this.dateTime,
      required this.phoneNumber,
      required this.userName,
      required this.address,
      this.price});

  final List<String>? image;
  final String title;
  final String description;
  final String dateTime;
  final String phoneNumber;
  final String userName;
  final String address;
  final String? price;

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'title': title,
      'description': description,
      'dateTime': dateTime,
      'phoneNumber': phoneNumber,
      'userName': userName,
      'address': address,
      'price': price,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      image: List<String>.from(map['image'] ?? ''),
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      dateTime: map['dateTime'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      userName: map['userName'] ?? '',
      address: map['address'] ?? '',
      price: map['price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
