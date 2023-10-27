import 'dart:convert';

import 'package:apollo23_app/models/event_model.dart';
import 'package:apollo23_app/models/message_model.dart';

class EventRepository {
  static var event1 = jsonDecode(
      '{"id":"1", "name":"Hackweek", "start_date":"19/10/2023", "end_date":"31/10/2023", "website":"www.google.com"}');
  static var event2 = jsonDecode(
      '{"id":"2", "name":"Oktobertech", "start_date":"17/10/2023", "end_date":"20/10/2023", "website":"www.google.com"}');

  static var message1 = jsonDecode(
      '{"event_id":1,"sender_id":0,"recipient_id":0,"text":"Dolor nostrud nostrud cupidatat eiusmod nisi esse velit incididunt ea aliqua anim sunt1.","date_time":"${DateTime.now()}"}');
  static var message2 = jsonDecode(
      '{"event_id":1,"sender_id":0,"recipient_id":0,"text":"Dolor nostrud nostrud cupidatat eiusmod nisi esse velit incididunt ea aliqua anim sunt2.","date_time":"${DateTime.now()}"}');
  static var message3 = jsonDecode(
      '{"event_id":1,"sender_id":0,"recipient_id":0,"text":"Dolor nostrud nostrud cupidatat eiusmod nisi esse velit incididunt ea aliqua anim sunt3.","date_time":"${DateTime.now()}"}');
  static var message4 = jsonDecode(
      '{"event_id":1,"sender_id":0,"recipient_id":0,"text":"Dolor nostrud nostrud cupidatat eiusmod nisi esse velit incididunt ea aliqua anim sunt4.","date_time":"${DateTime.now()}"}');
  static var message5 = jsonDecode(
      '{"event_id":2,"sender_id":0,"recipient_id":0,"text":"Dolor nostrud nostrud cupidatat eiusmod nisi esse velit incididunt ea aliqua anim sunt5s.","date_time":"${DateTime.now()}"}');

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
      list.add(MessageModel.fromJson(message4));
      list.add(MessageModel.fromJson(message4));
      list.add(MessageModel.fromJson(message4));
      list.add(MessageModel.fromJson(message4));
    } else {
      list.add(MessageModel.fromJson(message5));
    }

    await Future.delayed(const Duration(seconds: 2));
    return list;
  }
}
