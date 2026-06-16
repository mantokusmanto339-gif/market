import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Auth Token
  static Future<void> saveToken(String token) async {
    await _prefs.setString('auth_token', token);
  }

  static String? getToken() {
    return _prefs.getString('auth_token');
  }

  static Future<void> removeToken() async {
    await _prefs.remove('auth_token');
  }

  // User Data
  static Future<void> saveUser(Map<String, dynamic> userData) async {
    await _prefs.setString('user_data', userData.toString());
  }

  static String? getUser() {
    return _prefs.getString('user_data');
  }

  static Future<void> removeUser() async {
    await _prefs.remove('user_data');
  }

  // Cart
  static Future<void> saveCart(List<Map<String, dynamic>> cartItems) async {
    await _prefs.setStringList(
      'cart',
      cartItems.map((e) => e.toString()).toList(),
    );
  }

  static List<String>? getCart() {
    return _prefs.getStringList('cart');
  }

  static Future<void> removeCart() async {
    await _prefs.remove('cart');
  }

  // Clear all data
  static Future<void> clearAll() async {
    await _prefs.clear();
  }
}
