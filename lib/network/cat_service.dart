import 'dart:convert';

import 'package:http/http.dart' as http;

const Map<String, String> headers = {
  'x-api-key': '01d1ae1b-7bfd-4f22-bb40-36f26cbb579c',
};

Future<List<String>> fetchCatListLinks() async {
  var response = await http.get(
      'https://api.thecatapi.com/v1/images/search?limit=3&page=1&order=DESC',
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
