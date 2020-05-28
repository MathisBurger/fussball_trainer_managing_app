import 'package:http/http.dart';

Future<String> CallAPI(String request) async {
  String url = "http://webservice-rathje.de:8080" + request;
  Response response = await get(url);
  return response.body;
}