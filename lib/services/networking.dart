import 'dart:convert';

import 'package:http/http.dart';

class NetworkHelper {
  String url;

  NetworkHelper(this.url);

  Future getData() async {
    Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return decodedData;
    } else
      print(response.statusCode);
  }
}