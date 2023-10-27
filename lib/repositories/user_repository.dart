import 'dart:convert';

import 'package:apollo23_app/models/user_model.dart';

class UserRepository {
  static var user1 =
      jsonDecode('{"name":"user","email":"user@apollo23.com","social":{"linkedin": "www.linkedin.com"}}');
  static var user2 =
      jsonDecode('{"name":"admin","email":"admin@apollo23.com","social":{"linkedin": "www.linkedin.com"}}');
  static var user3 = jsonDecode(
      '{"name":"Palestrante Baita","email":"palestrante@apollo23.com","social":{"linkedin": "www.linkedin.com"}}');
  static var user4 = jsonDecode(
      '{"name":"Palestrante Top","email":"palestrante2@apollo23.com","social":{"linkedin": "www.linkedin.com"}}');
  static var user5 =
      jsonDecode('{"name":"Fulano de tal","email":"fulano@apollo23.com","social":{"linkedin": "www.linkedin.com"}}');
  static var user6 =
      jsonDecode('{"name":"Ciclano","email":"ciclano@apollo23.com","social":{"linkedin": "www.linkedin.com"}}');

  static UserModel login(String tipo) {
    if (tipo == 'admin') {
      return UserModel.fromJson(user2);
    }
    return UserModel.fromJson(user1);
  }
}
