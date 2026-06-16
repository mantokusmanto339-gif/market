import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;
  static const String baseUrl = 'http://localhost:3000/api/v1';

  ApiClient({Dio? dio})
      : _dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: baseUrl,
                connectTimeout: const Duration(seconds: 30),
                receiveTimeout: const Duration(seconds: 30),
                headers: {
                  'Content-Type': 'application/json',
                },
              ),
            );

  // Auth Endpoints
  Future<Response> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String role,
  }) {
    return _dio.post(
      '/auth/register',
      data: {
        'email': email,
        'password': password,
        'first_name': firstName,
        'last_name': lastName,
        'role': role,
      },
    );
  }

  Future<Response> login({
    required String email,
    required String password,
  }) {
    return _dio.post(
      '/auth/login',
      data: {
        'email': email,
        'password': password,
      },
    );
  }

  // Product Endpoints
  Future<Response> getProducts({
    int page = 1,
    int limit = 20,
    String? category,
    String? search,
  }) {
    return _dio.get(
      '/products',
      queryParameters: {
        'page': page,
        'limit': limit,
        if (category != null) 'category': category,
        if (search != null) 'search': search,
      },
    );
  }

  Future<Response> getProductDetail(String productId) {
    return _dio.get('/products/$productId');
  }

  // Order Endpoints
  Future<Response> createOrder({
    required List<Map<String, dynamic>> items,
    required String shippingAddress,
    required String paymentMethod,
  }) {
    return _dio.post(
      '/orders',
      data: {
        'items': items,
        'shipping_address': shippingAddress,
        'payment_method': paymentMethod,
      },
    );
  }

  Future<Response> getUserOrders(String userId) {
    return _dio.get('/orders/user/$userId');
  }

  // Set authorization token
  void setAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  // Remove authorization token
  void removeAuthToken() {
    _dio.options.headers.remove('Authorization');
  }
}
