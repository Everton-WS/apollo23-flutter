import 'package:flutter/material.dart';

class EventScoreColumnWidget extends StatelessWidget {
  final Map<String, dynamic> listActivities;

  const EventScoreColumnWidget({required this.listActivities, super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> content = [];
    for (var item in listActivities.entries) {
      if (item.key != 'score_total_evt') {
        content.add(ListTile(
          minLeadingWidth: 40,
          title: Text(item.key),
          leading: Text(item.value.toString(),
              style: const TextStyle(
                color: Colors.green,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
        ));
      }
    }
    return Column(children: content);
  }
}
