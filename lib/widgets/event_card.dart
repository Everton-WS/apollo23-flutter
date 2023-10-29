import 'package:apollo23_app/models/event_model.dart';
import 'package:apollo23_app/screens/event_screen.dart';
import 'package:flutter/material.dart';

class EventCardWidget extends StatelessWidget {
  final EventModel eventModel;

  const EventCardWidget({required this.eventModel, super.key});

  @override
  Widget build(BuildContext context) {
    String img = 'hackweek.jpg';
    if (eventModel.name == 'Oktobertech') {
      img = 'oktobertech.jpg';
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Card(
        elevation: 5,
        child: SizedBox(
          height: 100,
          child: Center(
            child: ListTile(
              visualDensity: const VisualDensity(vertical: 4),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EventScreen(eventModel: eventModel),
                ));
              },
              leading: Hero(
                tag: 'event-hero-${eventModel.id}',
                child: SizedBox(
                  height: 125,
                  width: 100,
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/img/$img'),
                  ),
                ),
              ),
              title: Text(
                eventModel.name,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              isThreeLine: true,
              subtitle: Text(
                'Início: ${eventModel.startDate} \nFim: ${eventModel.endDate}',
                textAlign: TextAlign.end,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
