import 'package:apollo23_app/models/event_model.dart';
import 'package:apollo23_app/models/speaker_model.dart';

class ActivityModel {
  late String id;
  late EventModel event;
  late String title;
  late String description;
  late SpeakerModel speaker;
  late String type;
  late String date;
  late String startHour;
  late String endHour;
  late String local;

  ActivityModel({
    required this.id,
    required this.event,
    required this.title,
    required this.description,
    required this.speaker,
    required this.type,
    required this.date,
    required this.startHour,
    required this.endHour,
    required this.local,
  });

  ActivityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    event = EventModel.fromJson(json['event']);
    type = json['type'] ?? '';
    title = json['name'] ?? '';
    description = json['description'] ?? '';
    speaker = SpeakerModel.fromJson(json['speaker']);
    date = json['date'] ?? '';
    startHour = json['start_time'] ?? '';
    endHour = json['end_time'] ?? '';
    local = json['location'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "event": event.toJson(),
      "type": type,
      "title": title,
      "description": description,
      "speaker": speaker.toJson(),
      "date": date,
      "start_hour": startHour,
      "end_hour": endHour,
      "local": local
    };
  }
}
