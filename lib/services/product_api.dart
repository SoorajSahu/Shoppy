import 'dart:convert';
import 'package:shoppy/models/product2.dart';
import 'package:http/http.dart' as http;

class Shop {
  static Future<Products> getdata() async {
    final response = await http.get(
      Uri.parse(
          'https://api.shoopy.in/api/v1/org/28052/super-products?online-only=true&child-cat-products=true&page=0&size=10&sort=qty,desc'),
    );
    print(response.statusCode);

    String jsondata = response.body.toString();
    Products shop = parseResponse(jsondata);
    return shop;
  }

  static Products parseResponse(String responseBody) {
    print(responseBody);
    final parsed = json.decode(responseBody);
    return Products.fromJson(parsed);
  }
}
