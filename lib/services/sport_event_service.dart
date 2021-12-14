import 'package:calorie_tracker/models/sport_event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SportEventService {
  static Future<List<SportEvent>> fetchSportEvents() async {
    List<SportEvent> sportEvents = [];
    QuerySnapshot response =
        await FirebaseFirestore.instance.collection('sport_events').get();

    for (var element in response.docs) {
      SportEvent sportEvent =
          SportEvent.fromMap(element.data() as Map<String, dynamic>);

      sportEvents.add(sportEvent);
    }

    return sportEvents;
  }
}
