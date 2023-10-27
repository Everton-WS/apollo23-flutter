import 'dart:convert';

import 'package:apollo23_app/models/activity_model.dart';
import 'package:apollo23_app/models/event_model.dart';
import 'package:apollo23_app/models/question_model.dart';
import 'package:apollo23_app/repositories/event_repository.dart';
import 'package:apollo23_app/repositories/user_repository.dart';

class ActivityRepository {
  static var speaker1 = jsonDecode(
      '{"event_id":1,"name":"Palestrante1","social_media":"xxx","mini_bio":"Eu nostrud magna cupidatat fugiat enim minim nulla amet deserunt et aliqua quis cupidatat pariatur."}');
  static var speaker2 = jsonDecode(
      '{"event_id":1,"name":"Palestrante2","social_media":"xxx","mini_bio":"Pariatur fugiat fugiat officia nisi proident non aliqua ex."}');
  static var speaker3 = jsonDecode(
      '{"event_id":2,"name":"Palestrante3","social_media":"xx","mini_bio":"Elit velit anim excepteur ad Lorem mollit sit occaecat nisi duis officia proident."}');

  static var activity1 = jsonDecode(
      '{"id":"1","event":${jsonEncode(EventRepository.event1)},"name":"Ideação","description":"    Duis laborum veniam voluptate sint occaecat duis enim. Nostrud voluptate dolor reprehenderit irure officia sit id sunt dolor excepteur in aute est deserunt. Proident reprehenderit irure ex mollit id esse deserunt velit. Pariatur excepteur incididunt culpa tempor. \\n    Duis laborum veniam voluptate sint occaecat duis enim. Nostrud voluptate dolor reprehenderit irure officia sit id sunt dolor excepteur in aute est deserunt. Proident reprehenderit irure ex mollit id esse deserunt velit. Pariatur excepteur incididunt culpa tempor.\\n    Duis laborum veniam voluptate sint occaecat duis enim. Nostrud voluptate dolor reprehenderit irure officia sit id sunt dolor excepteur in aute est deserunt. Proident reprehenderit irure ex mollit id esse deserunt velit. Pariatur excepteur incididunt culpa tempor.\\n    Duis laborum veniam voluptate sint occaecat duis enim. Nostrud voluptate dolor reprehenderit irure officia sit id sunt dolor excepteur in aute est deserunt. Proident reprehenderit irure ex mollit id esse deserunt velit. Pariatur excepteur incididunt culpa tempor.","speaker":${jsonEncode(speaker1)},"date":"20/10/2023","start_time":"18:30:00","end_time":"21:30:00","location":"Galpão Arquitetura Furb"}');
  static var activity2 = jsonDecode(
      '{"id":"2","event":${jsonEncode(EventRepository.event1)},"name":"Prototipação","description":"    Duis laborum veniam voluptate sint occaecat duis enim. Nostrud voluptate dolor reprehenderit irure officia sit id sunt dolor excepteur in aute est deserunt. Proident reprehenderit irure ex mollit id esse deserunt velit. Pariatur excepteur incididunt culpa tempor.","speaker":${jsonEncode(speaker2)},"date":"23/10/2023","start_time":"18:30:00","end_time":"21:30:00","location":"Galpão Arquitetura Furb"}');
  static var activity3 = jsonDecode(
      '{"id":"3","event":${jsonEncode(EventRepository.event2)},"name":"Flutter é legal","description":"    Duis laborum veniam voluptate sint occaecat duis enim. Nostrud voluptate dolor reprehenderit irure officia sit id sunt dolor excepteur in aute est deserunt. Proident reprehenderit irure ex mollit id esse deserunt velit. Pariatur excepteur incididunt culpa tempor.","speaker":${jsonEncode(speaker3)},"date":"23/10/2023","start_time":"18:30:00","end_time":"21:30:00","location":"Galpão Arquitetura Furb"}');

  static var question1 = jsonDecode(
      '{"user":${jsonEncode(UserRepository.user5)}, "activity":${jsonEncode(activity1)}, "question_text":"Ut eu elit minim mollit. Elit dolore eu cupidatat adipisicing cupidatat reprehenderit dolore veniam veniam laborum id sunt fugiat. Laborum reprehenderit labore incididunt cillum.", "date":"23/10/2023", "hour":"10:30:00"}');
  static var question2 = jsonDecode(
      '{"user":${jsonEncode(UserRepository.user6)}, "activity":${jsonEncode(activity1)}, "question_text":"Sint labore nostrud et ipsum ipsum voluptate anim labore dolore exercitation ad cillum.", "date":"23/10/2023", "hour":"10:53:00"}');
  static var question3 = jsonDecode(
      '{"user":${jsonEncode(UserRepository.user6)}, "activity":${jsonEncode(activity1)}, "question_text":"Sint labore nostrud et ipsum ipsum voluptate anim labore dolore exercitation ad cillum.", "date":"23/10/2023", "hour":"10:53:00"}');
  static var question4 = jsonDecode(
      '{"user":${jsonEncode(UserRepository.user6)}, "activity":${jsonEncode(activity2)}, "question_text":"Sint labore nostrud et ipsum ipsum voluptate anim labore dolore exercitation ad cillum.", "date":"23/10/2023", "hour":"10:53:00"}');
  static var question5 = jsonDecode(
      '{"user":${jsonEncode(UserRepository.user6)}, "activity":${jsonEncode(activity3)}, "question_text":"Sint labore nostrud et ipsum ipsum voluptate anim labore dolore exercitation ad cillum.", "date":"23/10/2023", "hour":"10:53:00"}');
  static var question6 = jsonDecode(
      '{"user":${jsonEncode(UserRepository.user6)}, "activity":${jsonEncode(activity3)}, "question_text":"Sint labore nostrud et ipsum ipsum voluptate anim labore dolore exercitation ad cillum.", "date":"23/10/2023", "hour":"10:53:00"}');

  static Future<List<ActivityModel>> getAll(EventModel eventModel) async {
    List<ActivityModel> listActivities = [];

    if (eventModel.id == '1') {
      listActivities.add(ActivityModel.fromJson(activity1));
      listActivities.add(ActivityModel.fromJson(activity2));
    } else {
      listActivities.add(ActivityModel.fromJson(activity3));
    }

    await Future.delayed(Duration.zero);
    return listActivities;
  }

  List<QuestionModel>? listQuestions;

  Future<List<QuestionModel>> getQuestions(ActivityModel activityModel) async {
    if (listQuestions == null) {
      listQuestions = [];
      if (activityModel.id == '1') {
        listQuestions!.add(QuestionModel.fromJson(question1));
        listQuestions!.add(QuestionModel.fromJson(question2));
        listQuestions!.add(QuestionModel.fromJson(question3));
      }

      if (activityModel.id == '2') {
        listQuestions!.add(QuestionModel.fromJson(question4));
        listQuestions!.add(QuestionModel.fromJson(question5));
      }

      if (activityModel.id == '3') {
        listQuestions!.add(QuestionModel.fromJson(question6));
      }
    }
    await Future.delayed(Duration.zero);
    return listQuestions!;
  }

  Future<void> addQuestion(QuestionModel questionModel) async {
    await Future.delayed(Duration.zero);
    listQuestions!.add(questionModel);
  }
}
