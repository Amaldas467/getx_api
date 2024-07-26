import 'dart:convert';
import 'package:getx_api/model/api/api.dart';
import 'package:http/http.dart' as http;

class CartService {
  static const String baseUrl = 'https://dummyjson.com/carts';

  Future<Api> getCarts() async {
    final response = await http.get(Uri.parse(baseUrl));

    print('Response status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return Api.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load carts');
    }
  }
}
