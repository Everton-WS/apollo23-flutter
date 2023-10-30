import 'package:apollo23_app/models/activity_model.dart';

class EventModel {
  late String id;
  late String name;
  late String webSite;
  late String startDate;
  late String endDate;
  late String? city = 'Blumenau';
  late String? state = 'Santa Catarina';
  late List<ActivityModel>? listActivities;

  EventModel(
      {required this.id,
      required this.name,
      required this.webSite,
      required this.startDate,
      required this.endDate,
      this.listActivities});

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    webSite = json['website'] ?? '';
    startDate = json['start_date'] ?? '';
    endDate = json['end_date'] ?? '';
    city = json['city'] ?? 'Blumenau';
    state = json['state'] ?? 'Santa Catarina';
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "website": webSite,
      "start_date": startDate,
      "end_date": endDate,
      "city": city ?? 'Blumenau',
      "state": state ?? 'Santa Catarina'
    };
  }
}
