import 'package:apollo23_app/models/event_model.dart';
import 'package:apollo23_app/screens/event_screen.dart';
import 'package:flutter/material.dart';

class EventCardWidget extends StatelessWidget {
  final EventModel eventModel;

  const EventCardWidget({required this.eventModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Card(
        elevation: 5,
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EventScreen(eventModel: eventModel),
            ));
          },
          leading: Hero(
            tag: 'event-hero-${eventModel.id}',
            child: const Icon(
              Icons.image,
              size: 50,
            ),
          ),
          title: Text(eventModel.name),
          //subtitle: Text('Evento: ${activityModel.event.name}'),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Início: ${eventModel.startDate}'),
              Text('Fim: ${eventModel.endDate}'),
            ],
          ),
        ),
      ),
    );
  }
}
