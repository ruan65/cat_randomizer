import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

const Map<String, String> headers = {
  'x-api-key': '3b4b2812-be2d-4776-9075-e5b3a4a5ba1b',
};

Future<List<String>> fetchCatListLinks() async {
  var response = await http.get(
      'https://api.thecatapi.com/v1/images/search?limit=3&'
      'page=${Random().nextInt(100)}'
      '&order=DESC',
      headers: headers);

  print('response: ${response.statusCode} ${response.body}');

  return extractCatalinks(response.body);
}

List<String> extractCatalinks(String body) {
  final List<String> result = [];

  var decoded = json.decode(body);

  try {
    var list = decoded as List;

    for (dynamic el in list) {
      result.add(el['url']);
    }
  } catch (ex) {
    print(ex);
  }

  return result;
}
