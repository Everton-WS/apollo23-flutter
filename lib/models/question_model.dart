import 'package:apollo23_app/models/activity_model.dart';
import 'package:apollo23_app/models/user_model.dart';

class QuestionModel {
  late UserModel user;
  late ActivityModel activity;
  late String speakerId;
  late String questionText;

  QuestionModel({required this.user, required this.activity, required this.speakerId, required this.questionText});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    user = UserModel.fromJson(json['user']);
    activity = ActivityModel.fromJson(json['activity']);
    speakerId = json['speaker_id'] ?? '';
    questionText = json['question_text'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": 0,
      "user": user.toJson(),
      "activity": activity.toJson(),
      "speaker_id": speakerId,
      "question_text": questionText
    };
  }
}
