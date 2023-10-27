import 'dart:convert';

import 'package:apollo23_app/models/event_model.dart';
import 'package:apollo23_app/models/message_model.dart';
import 'package:apollo23_app/consts/consts.dart';
import 'package:http/http.dart' as http;


class EventRepository {
  static var event1 = jsonDecode(
      '{"id":"1", "name":"Hackweek", "start_date":"19/10/2023", "end_date":"31/10/2023", "website":"www.google.com"}');
  static var event2 = jsonDecode(
      '{"id":"2", "name":"Oktobertech", "start_date":"17/10/2023", "end_date":"20/10/2023", "website":"www.google.com"}');

  static var message1 = jsonDecode(
      '{"event_id":1,"sender_id":0,"recipient_id":0,"text":"Dolor nostrud nostrud cupidatat eiusmod nisi esse velit incididunt ea aliqua anim sunt.","date_time":"${DateTime.now()}"}');
  static var message2 = jsonDecode(
      '{"event_id":1,"sender_id":0,"recipient_id":0,"text":"Dolor nostrud nostrud cupidatat eiusmod nisi esse velit incididunt ea aliqua anim sunt.","date_time":"${DateTime.now()}"}');
  static var message3 = jsonDecode(
      '{"event_id":1,"sender_id":0,"recipient_id":0,"text":"Dolor nostrud nostrud cupidatat eiusmod nisi esse velit incididunt ea aliqua anim sunt.","date_time":"${DateTime.now()}"}');
  static var message4 = jsonDecode(
      '{"event_id":1,"sender_id":0,"recipient_id":0,"text":"Dolor nostrud nostrud cupidatat eiusmod nisi esse velit incididunt ea aliqua anim sunt.","date_time":"${DateTime.now()}"}');
  static var message5 = jsonDecode(
      '{"event_id":2,"sender_id":0,"recipient_id":0,"text":"Dolor nostrud nostrud cupidatat eiusmod nisi esse velit incididunt ea aliqua anim sunt.","date_time":"${DateTime.now()}"}');

  static Future<List<EventModel>> getAll() async {
    List<EventModel> list = [];
    list.add(EventModel.fromJson(event1));
    list.add(EventModel.fromJson(event2));
    await Future.delayed(Duration.zero);
    return list;
  }

  static Future<List<MessageModel>> getMessages(EventModel eventModel) async {
    List<MessageModel> list = [];

    if (eventModel.id == '1') {
      list.add(MessageModel.fromJson(message1));
      list.add(MessageModel.fromJson(message2));
      list.add(MessageModel.fromJson(message3));
      list.add(MessageModel.fromJson(message4));
    } else {
      list.add(MessageModel.fromJson(message5));
    }

    await Future.delayed(Duration.zero);
    return list;
  }

  static Future<EventModel> getEventById(id) async {
    String unencodedPath = "api/events/$id";
    Uri uri = Uri.https (HTTPS_AUTHORITY, unencodedPath);

    http.Response resposta = await http.get(uri);
    var respostaObj = jsonDecode(resposta.body);
    EventModel eventModel = EventModel.fromJson(respostaObj as JsonMap);
    return eventModel;
  }

  static Future<List<EventModel>> getEvents() async {
    String unencodedPath = "api/events/";
    Uri uri = Uri.https (HTTPS_AUTHORITY, unencodedPath);

    http.Response resposta = await http.get(uri);
    var respostaObj = jsonDecode(resposta.body);
    List<EventModel> eventList = [];

    (respostaObj["results"] as List<dynamic>).forEach((element) {
      eventList.add(EventModel.fromJson(element as JsonMap));
    });
    return eventList;
  }

}
