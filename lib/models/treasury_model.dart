class TreasuryModel {
//  late int id;
  late int eventId;
  late int activityId;
  late String token;
  late int score;

  TreasuryModel({required this.eventId, required this.activityId, required this.token, required this.score});

  TreasuryModel.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    activityId = json['activity_id'];
    token = json['token'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    return {"event_id": eventId, "activity_id": activityId, "token": token, "score": score};
  }
}
