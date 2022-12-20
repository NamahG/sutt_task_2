import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper1 {
  NetworkHelper1(this.url);

  final String url;

  Uri uri = Uri.https('https://irctc1.p.rapidapi.com/api/v2/trainBetweenStations');

  Future getData() async {
    http.Response response = await http.get(uri, headers: {
    "X-RapidAPI-Key": "99a822a504msh215305dc9d2e8d5p15ce89jsnc24452184367",
      "X-RapidAPI-Host": "irctc1.p.rapidapi.com",
    });

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}