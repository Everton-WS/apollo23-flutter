class MessageModel {
//  late int id;
  late int eventId;
  late int senderId;
  late int recipientId;
  late String text;
  late DateTime dateTime;

  MessageModel(
      {required this.eventId,
      required this.senderId,
      required this.recipientId,
      required this.text,
      required this.dateTime});

  MessageModel.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    senderId = json['sender_id'];
    recipientId = json['recipient_id'];
    text = json['text'];
    dateTime = DateTime.parse(json['date_time']);
  }
}
