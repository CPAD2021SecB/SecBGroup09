import 'package:cloud_firestore/cloud_firestore.dart';

class SportEvent {
  SportEvent({
    required this.imageUrl,
    required this.eventName,
    required this.location,
    required this.date,
  });

  final String imageUrl;
  final String eventName;
  final String location;
  final DateTime date;

  static fromMap(Map<String, dynamic> json) => SportEvent(
        imageUrl: json["image_url"],
        eventName: json["event_name"],
        location: json["location"],
        date: (json["date"] as Timestamp).toDate(),
      );

  Map<String, dynamic> toMap() => {
        "image_url": imageUrl,
        "event_name": eventName,
        "location": location,
        "date": date.toIso8601String(),
      };
}
