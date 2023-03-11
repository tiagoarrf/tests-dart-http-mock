import 'dart:convert';

import 'package:http/http.dart' as http;

int calculate() {
  return 6 * 7;
}

Future<Map<dynamic, dynamic>> retornarCEP(String cep) async {
  var url = (Uri.parse("https://viacep.com.br/ws/$cep/json/"));
  var res = await http.get(url);
  var decodeRes = jsonDecode(utf8.decode(res.bodyBytes)) as Map;
  return decodeRes;
}
