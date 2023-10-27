class MyTreasuryModel {

//  late int id;
  late int eventId;
  late int userId;
  late int treasuryId;
  late int score;
  late DateTime dateTime;

  MyTreasuryModel({required this.eventId, required this.userId, required this.treasuryId, required this.score, required this.dateTime});

  MyTreasuryModel.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    userId = json['user_id'];
    treasuryId = json['treasure_id'];
    score = json['score'];
    dateTime = json['date_time'];
  }

}
