// lib/data/models/product_model.dart
import 'package:hive/hive.dart';


@HiveType(typeId: 0)
class ProductModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final double price;
  @HiveField(4)
  final int? stock;
  @HiveField(5)
  final String? category;
  @HiveField(6)
  final String? image;
  @HiveField(7)
  final String? brand;
  @HiveField(8)
  final bool? isDiscounted;
  @HiveField(9)
  final double? discountPercent;
  @HiveField(10)
  final List<String>? tags;
  @HiveField(11)
  final bool? isActive;
  @HiveField(12)
  final double? weight;
  @HiveField(13)
  final List<String>? colors;
  @HiveField(14)
  final String? dimensions;
  @HiveField(15)
  final DateTime? createdAt;

  ProductModel({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    this.stock,
    this.category,
    this.image,
    this.brand,
    this.isDiscounted,
    this.discountPercent,
    this.tags,
    this.isActive,
    this.weight,
    this.colors,
    this.dimensions,
    this.createdAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      // API uses 'id' in some places and '_id' in others; this handles both
      id: json['id'] ?? json['_id'] ?? '',
      name: json['name'] ?? 'Unknown Product',
      description: json['description'],
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      stock: json['stock'] as int?,
      category: json['category'],
      image: json['image'],
      brand: json['brand'],
      isDiscounted: json['isDiscounted'] as bool?,
      discountPercent: (json['discountPercent'] as num?)?.toDouble(),
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
      isActive: json['isActive'] as bool?,
      weight: (json['weight'] as num?)?.toDouble(),
      colors: json['colors'] != null ? List<String>.from(json['colors']) : null,
      dimensions: json['dimensions'],
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'stock': stock,
      'category': category,
      'image': image,
      'brand': brand,
      'isDiscounted': isDiscounted,
      'discountPercent': discountPercent,
      'tags': tags,
      'isActive': isActive,
      'weight': weight,
      'colors': colors,
      'dimensions': dimensions,
    };
  }
}