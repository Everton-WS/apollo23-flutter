import 'package:apollo23_app/models/event_model.dart';
import 'package:flutter/material.dart';

class EventFaqScreen extends StatefulWidget {
  final EventModel eventModel;

  const EventFaqScreen({required this.eventModel, super.key});

  @override
  State<EventFaqScreen> createState() => _EventFaqScreenState();
}

class _EventFaqScreenState extends State<EventFaqScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Icon(
              Icons.rocket,
              color: Colors.deepPurple,
            ),
            SizedBox(width: 10),
            Text('FAQ')
          ]),
        ),
        body: ListView(
          children: const [
            Card(
              child: ExpansionTile(
                title: Text('Onde posso me hospedar?'),
                children: <Widget>[
                  ListTile(
                      title: Text(
                          'Duis laborum veniam voluptate sint occaecat duis enim. Nostrud voluptate dolor reprehenderit irure officia sit id sunt dolor excepteur in aute est deserunt. Proident reprehenderit irure ex mollit id esse deserunt velit.')),
                ],
              ),
            ),
            Card(
              child: ExpansionTile(
                title: Text('Quais restaurantes o evento recomenda?'),
                children: <Widget>[
                  ListTile(
                      title: Text(
                          'Duis laborum veniam voluptate sint occaecat duis enim. Nostrud voluptate dolor reprehenderit irure officia sit id sunt dolor excepteur in aute est deserunt. Proident reprehenderit irure ex mollit id esse deserunt velit.')),
                ],
              ),
            ),
            Card(
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Text('O evento possui estacionamento?'),
                children: <Widget>[
                  ListTile(
                      title: Text(
                          'Duis laborum veniam voluptate sint occaecat duis enim. Nostrud voluptate dolor reprehenderit irure officia sit id sunt dolor excepteur in aute est deserunt. Proident reprehenderit irure ex mollit id esse deserunt velit.')),
                ],
              ),
            ),
            Card(
              child: ExpansionTile(
                title: Text('Como faço para ganhar ponto?'),
                children: <Widget>[
                  ListTile(
                      title: Text(
                          'Duis laborum veniam voluptate sint occaecat duis enim. Nostrud voluptate dolor reprehenderit irure officia sit id sunt dolor excepteur in aute est deserunt. Proident reprehenderit irure ex mollit id esse deserunt velit.')),
                ],
              ),
            )
          ],
        ));
  }
}
