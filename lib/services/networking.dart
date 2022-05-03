import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    // http.Response response = await http.get(Uri.https('api.openweathermap.org',
    //     'data/2.5/onecall?lat={$latitude}&lon={$longitude}&appid={$apiKey}'));
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);
      return decodeData;
    } else {
      // ignore: avoid_print
      print(response.statusCode);
    }
  }
}
