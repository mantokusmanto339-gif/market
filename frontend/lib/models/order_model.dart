// Order Model
class Order {
  final String id;
  final String orderNumber;
  final String userId;
  final String shopId;
  final double totalAmount;
  final double discountAmount;
  final double taxAmount;
  final double finalAmount;
  final String paymentStatus; // pending, completed, failed, cancelled
  final String orderStatus; // pending, processing, shipped, delivered, cancelled
  final String shippingStatus; // pending, shipped, in_transit, delivered
  final String paymentMethod;
  final String shippingAddress;
  final double? shippingCost;
  final String? trackingNumber;
  final String? courier;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? completedAt;
  final DateTime? cancelledAt;

  Order({
    required this.id,
    required this.orderNumber,
    required this.userId,
    required this.shopId,
    required this.totalAmount,
    required this.discountAmount,
    required this.taxAmount,
    required this.finalAmount,
    required this.paymentStatus,
    required this.orderStatus,
    required this.shippingStatus,
    required this.paymentMethod,
    required this.shippingAddress,
    this.shippingCost,
    this.trackingNumber,
    this.courier,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.completedAt,
    this.cancelledAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as String,
      orderNumber: json['order_number'] as String,
      userId: json['user_id'] as String,
      shopId: json['shop_id'] as String,
      totalAmount: (json['total_amount'] as num).toDouble(),
      discountAmount: (json['discount_amount'] as num).toDouble(),
      taxAmount: (json['tax_amount'] as num).toDouble(),
      finalAmount: (json['final_amount'] as num).toDouble(),
      paymentStatus: json['payment_status'] as String,
      orderStatus: json['order_status'] as String,
      shippingStatus: json['shipping_status'] as String,
      paymentMethod: json['payment_method'] as String,
      shippingAddress: json['shipping_address'] as String,
      shippingCost: (json['shipping_cost'] as num?)?.toDouble(),
      trackingNumber: json['tracking_number'] as String?,
      courier: json['courier'] as String?,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      completedAt: json['completed_at'] != null
          ? DateTime.parse(json['completed_at'] as String)
          : null,
      cancelledAt: json['cancelled_at'] != null
          ? DateTime.parse(json['cancelled_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_number': orderNumber,
      'user_id': userId,
      'shop_id': shopId,
      'total_amount': totalAmount,
      'discount_amount': discountAmount,
      'tax_amount': taxAmount,
      'final_amount': finalAmount,
      'payment_status': paymentStatus,
      'order_status': orderStatus,
      'shipping_status': shippingStatus,
      'payment_method': paymentMethod,
      'shipping_address': shippingAddress,
      'shipping_cost': shippingCost,
      'tracking_number': trackingNumber,
      'courier': courier,
      'notes': notes,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
      'cancelled_at': cancelledAt?.toIso8601String(),
    };
  }

  bool get isPending => orderStatus == 'pending';
  bool get isProcessing => orderStatus == 'processing';
  bool get isShipped => orderStatus == 'shipped';
  bool get isDelivered => orderStatus == 'delivered';
  bool get isCancelled => orderStatus == 'cancelled';
  bool get isPaid => paymentStatus == 'completed';

  Order copyWith({
    String? id,
    String? orderNumber,
    String? userId,
    String? shopId,
    double? totalAmount,
    double? discountAmount,
    double? taxAmount,
    double? finalAmount,
    String? paymentStatus,
    String? orderStatus,
    String? shippingStatus,
    String? paymentMethod,
    String? shippingAddress,
    double? shippingCost,
    String? trackingNumber,
    String? courier,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? completedAt,
    DateTime? cancelledAt,
  }) {
    return Order(
      id: id ?? this.id,
      orderNumber: orderNumber ?? this.orderNumber,
      userId: userId ?? this.userId,
      shopId: shopId ?? this.shopId,
      totalAmount: totalAmount ?? this.totalAmount,
      discountAmount: discountAmount ?? this.discountAmount,
      taxAmount: taxAmount ?? this.taxAmount,
      finalAmount: finalAmount ?? this.finalAmount,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      orderStatus: orderStatus ?? this.orderStatus,
      shippingStatus: shippingStatus ?? this.shippingStatus,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      shippingCost: shippingCost ?? this.shippingCost,
      trackingNumber: trackingNumber ?? this.trackingNumber,
      courier: courier ?? this.courier,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      completedAt: completedAt ?? this.completedAt,
      cancelledAt: cancelledAt ?? this.cancelledAt,
    );
  }
}
