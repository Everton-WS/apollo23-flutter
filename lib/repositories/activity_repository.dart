import 'dart:convert';

import 'package:apollo23_app/models/activity_model.dart';
import 'package:apollo23_app/models/event_model.dart';
import 'package:apollo23_app/models/question_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ActivityRepository {
  static final _url = "${dotenv.get('API_HOST')}:${dotenv.get('API_PORT')}";

  static Future<List<ActivityModel>> getAll(EventModel eventModel) async {
    Uri uri = Uri.http(_url, '/activity');
    http.Response resposta = await http.get(uri);
    var respostaObj = jsonDecode(resposta.body);
    List<ActivityModel> list = [];
    for (var item in respostaObj) {
      ActivityModel activityModel = ActivityModel.fromJson(item);
      if (eventModel.id == activityModel.event.id) {
        list.add(activityModel);
      }
    }
    return list;
  }

  List<QuestionModel>? listQuestions;

  Future<List<QuestionModel>> getQuestions(ActivityModel activityModel) async {
    //if (listQuestions == null) {
    listQuestions = [];
    Uri uri = Uri.http(_url, '/question');
    http.Response resposta = await http.get(uri);
    var respostaObj = jsonDecode(resposta.body);
    for (var item in respostaObj) {
      QuestionModel questionModel = QuestionModel.fromJson(item);
      if (questionModel.activity.id == activityModel.id) {
        listQuestions!.add(questionModel);
      }
    }
    //}
    return listQuestions!;
  }

  Future<void> addQuestion(QuestionModel questionModel) async {
    http.post(
      Uri.parse('http://$_url/question'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(questionModel.toJson()),
    );

    //await Future.delayed(Duration.zero);
    //listQuestions!.add(questionModel);
  }
}
