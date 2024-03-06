import 'dart:convert';

import 'package:http/http.dart' as http;

// ignore: camel_case_types
class api {
  Future<dynamic> get({required String uri}) async {
    http.Response response = await http.get(Uri.parse(uri));
    print(response.body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is an error with status code ${response.statusCode}');
    }
  }
}
