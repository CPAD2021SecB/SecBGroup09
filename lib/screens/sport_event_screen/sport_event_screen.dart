import 'package:calorie_tracker/models/sport_event.dart';
import 'package:calorie_tracker/services/sport_event_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class SportEventScreen extends StatefulWidget {
  const SportEventScreen({Key? key}) : super(key: key);

  @override
  State<SportEventScreen> createState() => _SportEventScreenState();
}

class _SportEventScreenState extends State<SportEventScreen> {
  late Future<List<SportEvent>> _fetchSportEvents;

  @override
  void initState() {
    super.initState();

    _fetchSportEvents = SportEventService.fetchSportEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF262626),
      appBar: AppBar(
        title: const Text("Sport Events"),
        backgroundColor: const Color(0xFF262626),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: Get.width * 0.05,
          right: Get.width * 0.05,
          top: Get.height * 0.02,
        ),
        child: FutureBuilder(
          future: _fetchSportEvents,
          builder: (context, snapshot) {
            List<SportEvent> sportEventList = snapshot.data as List<SportEvent>;
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return SingleChildScrollView(
                  child: Column(
                    children: [1, 2, 3, 4, 5]
                        .map(
                          (index) => Shimmer.fromColors(
                            child: Container(
                              height: Get.height * 0.35,
                              margin:
                                  EdgeInsets.only(bottom: Get.height * 0.04),
                            ),
                            baseColor: Colors.white,
                            highlightColor: Colors.grey.shade200,
                          ),
                        )
                        .toList(),
                  ),
                );
              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return ListView.builder(
                    itemCount: sportEventList.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, i) {
                      return Container(
                        height: Get.height * 0.35,
                        margin: EdgeInsets.only(bottom: Get.height * 0.04),
                        child: Stack(
                          children: [
                            Image.network(
                              sportEventList[i].imageUrl,
                              fit: BoxFit.cover,
                              width: Get.width,
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: Get.height * 0.1,
                                width: Get.width,
                                color: (i % 2 == 0)
                                    ? const Color(0xFFA2C101)
                                    : const Color(0xFFFDA104),
                                padding: EdgeInsets.all(Get.width * 0.02),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      sportEventList[i].eventName,
                                      style: TextStyle(
                                        fontSize: Get.height * 0.03,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.005,
                                    ),
                                    Text(
                                      "${sportEventList[i].location} | ${DateFormat.yMd().format(sportEventList[i].date)}",
                                      style: TextStyle(
                                        fontSize: Get.height * 0.02,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
