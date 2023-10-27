import 'dart:convert';

import 'package:apollo23_app/models/event_model.dart';
import 'package:apollo23_app/consts/consts.dart';
import 'package:apollo23_app/models/user_event_model.dart';
import 'package:http/http.dart' as http;


class EventRepository {

  static Future<List<UserEventModel>> getEventsByUser(userId) async {
    String unencodedPath = "api/user_events/$userId";
    Uri uri = Uri.https(HTTPS_AUTHORITY, unencodedPath);

    http.Response resposta = await http.get(uri);
    var respostaObj = jsonDecode(resposta.body);
    List<UserEventModel> userEventList = [];

    (respostaObj["results"] as List<dynamic>).forEach((element) {
        userEventList.add(UserEventModel.fromJson(element as JsonMap));
    });
    return userEventList;
  }

}
