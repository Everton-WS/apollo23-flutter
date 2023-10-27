import 'package:apollo23_app/models/event_model.dart';

class UserEventModel {
  late int id;
  late int userId;
  late int eventId;
  late EventModel event;

  UserEventModel({required this.id, required this.userId, required this.eventId, required this.event});

  UserEventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    eventId = json['event_id'];
    event = EventModel.fromJson(json['event']);
  }
  
}
