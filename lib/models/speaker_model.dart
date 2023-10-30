class SpeakerModel {
//  late int id;
  late int eventId;
  late String name;
  late String socialMedia;
  late String miniBio;

  SpeakerModel({required this.eventId, required this.name, required this.socialMedia, required this.miniBio});

  SpeakerModel.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    name = json['name'];
    socialMedia = json['social_media'];
    miniBio = json['mini_bio'];
  }

  Map<String, dynamic> toJson() {
    return {"event_id": eventId, "name": name, "social_media": socialMedia, "mini_bio": miniBio};
  }
}
