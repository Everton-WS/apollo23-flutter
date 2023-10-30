import 'package:apollo23_app/models/treasury_model.dart';
import 'package:apollo23_app/models/user_model.dart';

class MyTreasuryModel {
  late int id;
  //late int eventId;
  late UserModel user;
  late TreasuryModel treasury;
  late int score;
  late DateTime? dateTime;

  MyTreasuryModel({required this.id, required this.user, required this.treasury, required this.score, this.dateTime});

  MyTreasuryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    //eventId = json['event_id'];
    user = UserModel.fromJson(json['user']);
    treasury = TreasuryModel.fromJson(json['treasury']);
    score = json['score'];
    dateTime = DateTime.parse(json['date_time']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "user": user.toJson(),
      "treasury": treasury.toJson(),
      "score": score,
      "date_time": DateTime.now().toString()
    };
  }
}
