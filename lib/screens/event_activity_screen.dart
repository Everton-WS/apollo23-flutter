import 'package:apollo23_app/bloc/list_activity_bloc.dart';
import 'package:apollo23_app/models/event_model.dart';
import 'package:apollo23_app/widgets/activity_tile.dart';
import 'package:flutter/material.dart';

class EventActivityScreen extends StatefulWidget {
  final EventModel eventModel;

  const EventActivityScreen({required this.eventModel, super.key});

  @override
  State<EventActivityScreen> createState() => _EventActivityScreenState();
}

class _EventActivityScreenState extends State<EventActivityScreen> {
  late ListActivityBloc _bloc;

  _EventActivityScreenState();

  @override
  void initState() {
    _bloc = ListActivityBloc(widget.eventModel);
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

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
          Text('Atividades')
        ]),
      ),
      body: StreamBuilder(
        stream: _bloc.listActivityStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData && snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Sem informações'),
            );
          }

          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => ActivityTileWidget(activityModel: snapshot.data![index]));
        },
      ),
    );
  }
}
