import 'dart:convert';

import 'package:apollo23_app/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserRepository {
  static final _url = "${dotenv.get('API_HOST')}:${dotenv.get('API_PORT')}";

  static var user1 =
      jsonDecode('{"name":"user","email":"user@apollo23.com","social":{"linkedin": "www.linkedin.com"}}');

  static Future<UserModel?> login(String login) async {
    Uri uri = Uri.http(_url, '/user');
    http.Response resposta;
    try {
      resposta = await http.get(uri).timeout(const Duration(seconds: 5));
    } on Exception {
      throw 'Erro para conectar a base de dados!';
    }
    var respostaObj = jsonDecode(resposta.body);
    for (var item in respostaObj) {
      UserModel userModel = UserModel.fromJson(item);
      if (userModel.email == login) {
        return userModel;
      }
    }
    throw 'Usuário/Senha inválidos';
  }
}
