import 'dart:convert';

import 'package:apollo23_app/models/event_model.dart';
import 'package:apollo23_app/models/message_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class EventRepository {
  static final _url = "${dotenv.get('API_HOST')}:${dotenv.get('API_PORT')}";

  static Future<List<EventModel>> getAll() async {
    Uri uri = Uri.http(_url, '/event');
    http.Response resposta = await http.get(uri);
    var respostaObj = jsonDecode(resposta.body);
    List<EventModel> list = [];
    for (var item in respostaObj) {
      list.add(EventModel.fromJson(item));
    }
    return list;
  }

  static Future<List<MessageModel>> getMessages(EventModel eventModel) async {
    Uri uri = Uri.http(_url, '/message');
    http.Response resposta = await http.get(uri);
    var respostaObj = jsonDecode(resposta.body);
    List<MessageModel> list = [];
    for (var item in respostaObj) {
      MessageModel messageModel = MessageModel.fromJson(item);
      if (eventModel.id == messageModel.eventId.toString()) {
        list.add(messageModel);
      }
    }
    await Future.delayed(const Duration(milliseconds: 250));
    return list;
  }
}
