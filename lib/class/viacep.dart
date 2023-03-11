import 'package:http/http.dart' as http;
import 'dart:convert';

class ViaCEP {
  Future<Map<dynamic, dynamic>> retornarCEP(String cep) async {
    var url = (Uri.parse("https://viacep.com.br/ws/$cep/json/"));
    var res = await http.get(url);
    var decodeRes = jsonDecode(utf8.decode(res.bodyBytes)) as Map;
    return decodeRes;
  }
}
