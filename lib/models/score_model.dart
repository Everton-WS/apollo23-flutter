import 'package:apollo23_app/models/user_model.dart';

class ScoreModel {
  late UserModel user;
  late String eventName;
  late Map<String, dynamic> listActivities;
  late int eventScore;

  ScoreModel({required this.user, required this.eventName, required this.listActivities, required this.eventScore});
}
