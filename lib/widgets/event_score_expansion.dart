import 'package:apollo23_app/models/score_model.dart';
import 'package:apollo23_app/widgets/event_score_tile.dart';
import 'package:flutter/material.dart';

class EventScoreExpansionWidget extends StatelessWidget {
  final ScoreModel scoreModel;
  const EventScoreExpansionWidget({required this.scoreModel, super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(scoreModel.eventName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
      leading: Text(scoreModel.listActivities['score_total_evt'].toString(),
          style: const TextStyle(
            color: Colors.green,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
      children: [
        EventScoreColumnWidget(listActivities: scoreModel.listActivities)
      ],
    );
  }
}
