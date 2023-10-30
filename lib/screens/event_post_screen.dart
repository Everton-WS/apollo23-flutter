import 'package:apollo23_app/models/event_model.dart';
import 'package:flutter/material.dart';

class EventPostScreen extends StatefulWidget {
  final EventModel eventModel;

  const EventPostScreen({required this.eventModel, super.key});

  @override
  State<EventPostScreen> createState() => _EventPostScreenState();
}

class _EventPostScreenState extends State<EventPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                    const Text(
                      'É hoje, estamos esperando por vocês aqui!',
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                          color: Colors.grey[300]),
                      child: const Icon(
                        Icons.pin_drop_outlined,
                        size: 50,
                      ),
                    )
                  ]),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                    const Text('Olha o teaser que nosso palestrante nos mandou...'),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: double.infinity,
                        height: 250,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                            color: Colors.grey[300]),
                        child: const Icon(
                          Icons.play_circle,
                          size: 50,
                        ))
                  ]),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text('Faltam 3 dias para o evento, estão preparados?\n\n#vemPraHackweek'),
                  ]),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
