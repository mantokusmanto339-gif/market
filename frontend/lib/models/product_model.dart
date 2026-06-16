// Product Model
class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double discountPercentage;
  final double finalPrice;
  final int stock;
  final String sku;
  final double rating;
  final int totalSold;
  final String status;
  final bool isFeatured;
  final List<String> images;
  final Map<String, dynamic>? shop;
  final DateTime createdAt;
  final DateTime updatedAt;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.finalPrice,
    required this.stock,
    required this.sku,
    required this.rating,
    required this.totalSold,
    required this.status,
    required this.isFeatured,
    required this.images,
    this.shop,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      discountPercentage: (json['discount_percentage'] as num).toDouble(),
      finalPrice: (json['final_price'] as num).toDouble(),
      stock: json['stock'] as int,
      sku: json['sku'] as String,
      rating: (json['rating'] as num).toDouble(),
      totalSold: json['total_sold'] as int,
      status: json['status'] as String,
      isFeatured: json['is_featured'] as bool,
      images: List<String>.from(json['images'] as List),
      shop: json['shop'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'discount_percentage': discountPercentage,
      'final_price': finalPrice,
      'stock': stock,
      'sku': sku,
      'rating': rating,
      'total_sold': totalSold,
      'status': status,
      'is_featured': isFeatured,
      'images': images,
      'shop': shop,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  bool get isAvailable => stock > 0 && status == 'active';
  bool get isOnDiscount => discountPercentage > 0;

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    double? discountPercentage,
    double? finalPrice,
    int? stock,
    String? sku,
    double? rating,
    int? totalSold,
    String? status,
    bool? isFeatured,
    List<String>? images,
    Map<String, dynamic>? shop,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      finalPrice: finalPrice ?? this.finalPrice,
      stock: stock ?? this.stock,
      sku: sku ?? this.sku,
      rating: rating ?? this.rating,
      totalSold: totalSold ?? this.totalSold,
      status: status ?? this.status,
      isFeatured: isFeatured ?? this.isFeatured,
      images: images ?? this.images,
      shop: shop ?? this.shop,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
