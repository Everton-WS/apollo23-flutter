import 'dart:convert';

import 'package:apollo23_app/bloc/list_score_bloc.dart';
import 'package:apollo23_app/models/activity_model.dart';
import 'package:apollo23_app/models/event_model.dart';
import 'package:apollo23_app/models/my_treasury_model.dart';
import 'package:apollo23_app/models/score_model.dart';
import 'package:apollo23_app/models/treasury_model.dart';
import 'package:apollo23_app/models/user_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class TreasuryRepository {
  static final _url = "${dotenv.get('API_HOST')}:${dotenv.get('API_PORT')}";

  static Future<List<ScoreModel>> getScore(UserModel userModel) async {
    Uri evtUri = Uri.http(_url, '/event');
    http.Response evtResponse = await http.get(evtUri);
    var evtRespObj = jsonDecode(evtResponse.body);
    List<EventModel> evtList = [];
    for (var item in evtRespObj) {
      evtList.add(EventModel.fromJson(item));
    }

    Uri actUri = Uri.http(_url, '/activity');
    http.Response actResponse = await http.get(actUri);
    var actRespObj = jsonDecode(actResponse.body);
    List<ActivityModel> actList = [];
    for (var item in actRespObj) {
      actList.add(ActivityModel.fromJson(item));
    }

    Uri treUri = Uri.http(_url, '/my_treasury');
    http.Response treResponse = await http.get(treUri);
    var treRespObj = jsonDecode(treResponse.body);
    List<MyTreasuryModel> treList = [];
    for (var item in treRespObj) {
      treList.add(MyTreasuryModel.fromJson(item));
    }

    Map<String, Map<String, dynamic>> tempMap = {
      "": {"": ""}
    };
    List<ScoreModel> finalList = [];
    int eventScore = 0;
    int totalScore = 0;

    for (var item in treList) {
      if (item.user.email == userModel.email) {
        String eventName = evtList.firstWhere((element) => element.id == item.treasury.eventId.toString()).name;
        String activityTitle = actList.firstWhere((element) => element.id == item.treasury.activityId.toString()).title;
        if (tempMap[eventName] == null) {
          tempMap[eventName] = {'score_total_evt': 0};
        }
        if (tempMap[eventName]![activityTitle] == null) {
          tempMap[eventName]![activityTitle] = item.score;
        } else {
          tempMap[eventName]![activityTitle] += item.score;
        }
        tempMap[eventName]!['score_total_evt'] += item.score;
        totalScore += item.score;
      }
    }

    for (var item in tempMap.entries) {
      if (item.key.isNotEmpty) {
        ScoreModel score = ScoreModel(
            user: userModel,
            eventName: item.key,
            listActivities: item.value,
            eventScore: eventScore,
            userTotal: totalScore);
        finalList.add(score);
      }
    }
    return finalList;
  }

  static Future<int> sendTreasury(String qrCode, UserModel userModel) async {
    print(1);
    List<String> qrContent = qrCode.split('_');
    print(qrContent);
    print(userModel.email);

    if (qrContent.length == 3) {
      print(2);
      int? event = int.tryParse(qrContent[0]);
      int? activity = int.tryParse(qrContent[1]);
      String token = qrContent[2];
      print(3);
      if (event != null && activity != null && token.trim().isNotEmpty) {
        print(4);
        TreasuryModel treasury = TreasuryModel(eventId: event, activityId: activity, token: token, score: 0);
        print(5);
        return await _simulateBackendProcessingTreasury(treasury, userModel);
      }
    }
    print(6);
    http.Response respNoExist = await http.post(
      Uri.parse('http://$_url/my_treasury'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"id": 0, "return": 204}),
    );
    print(7);
    return respNoExist.statusCode;

    // print('\n\n$qrCode - ${userModel.email}\n\n');
    // await Future.delayed(const Duration(seconds: 3));
    // return 200;
  }

  static Future<int> _simulateBackendProcessingTreasury(TreasuryModel treasuryModel, UserModel userModel) async {
    print(8);
    bool foundTreasury = false;
    TreasuryModel? treasuryFromDB;
    Uri uri = Uri.http(_url, '/treasury');
    http.Response respTreasury = await http.get(uri);
    print(9);
    var respostaObj = jsonDecode(respTreasury.body);
    print(10);
    for (var item in respostaObj) {
      print(11);
      treasuryFromDB = TreasuryModel.fromJson(item);
      if (treasuryFromDB.eventId == treasuryModel.eventId &&
          treasuryFromDB.activityId == treasuryModel.activityId &&
          treasuryFromDB.token == treasuryModel.token) {
        foundTreasury = true;
        break;
      }
    }
    print(12);
    if (foundTreasury) {
      print(13);
      bool treasuryAlreadyExist = false;
      uri = Uri.http(_url, '/my_treasury');
      http.Response respMyTreasury = await http.get(uri);
      respostaObj = jsonDecode(respMyTreasury.body);
      print(14);
      MyTreasuryModel myTreasuriesFromDB;
      if (respostaObj.length > 0) {
        print(15);
        for (var item in respostaObj) {
          print(16);
          myTreasuriesFromDB = MyTreasuryModel.fromJson(item);
          if (treasuryFromDB!.eventId == myTreasuriesFromDB.treasury.eventId &&
              treasuryFromDB.activityId == myTreasuriesFromDB.treasury.activityId &&
              treasuryFromDB.token == myTreasuriesFromDB.treasury.token) {
            treasuryAlreadyExist = true;
            break;
          }
        }
      }
      print(17);
      if (treasuryAlreadyExist) {
        print(18);
        http.Response respAlreadyExist = await http.post(
          Uri.parse('http://$_url/my_treasury'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({"id": 0, "return": 400}),
        );
        print(19);
        return respAlreadyExist.statusCode;
      }
      print(20);
      MyTreasuryModel newTreasury =
          MyTreasuryModel(id: 0, user: userModel, treasury: treasuryFromDB!, score: treasuryFromDB.score);
      print(21);
      http.Response postResp = await http.post(
        Uri.parse('http://$_url/my_treasury'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(newTreasury.toJson()),
      );
      print(22);
      if (postResp.statusCode == 201) {
        print(23);
        ListScoreBloc(userModel);
        return 200;
      }

      http.Response respNotFound = await http.post(
        Uri.parse('http://$_url/my_treasury'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"id": 0, "return": 404}),
      );
      return respNotFound.statusCode;
    }
    http.Response respNoExist = await http.post(
      Uri.parse('http://$_url/my_treasury'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"id": 0, "return": 204}),
    );
    return respNoExist.statusCode;
  }
}
