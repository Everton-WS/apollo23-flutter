import 'package:apollo23_app/models/activity_model.dart';
import 'package:flutter/material.dart';

class ActivityInfoScreen extends StatelessWidget {
  final ActivityModel activityModel;

  const ActivityInfoScreen({required this.activityModel, super.key});

  @override
  Widget build(BuildContext context) {
    String img = 'sem imagem';
    if (activityModel.title == "Flutter para Android") {
      img = 'flutter.jpeg';
    }
    if (activityModel.title == "Java para API's") {
      img = 'java.png';
    }
    if (activityModel.title == 'Porque Postgress é o melhor BD') {
      img = 'postgres.png';
    }

    String img2 = 'hackweek.jpg';
    if (activityModel.event.name == 'Oktobertech') {
      img2 = 'oktobertech.jpg';
    }

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          title: Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
            const Icon(
              Icons.rocket,
              color: Colors.deepPurple,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                activityModel.title,
                overflow: TextOverflow.fade,
              ),
            )
          ]),
          pinned: true,
          stretch: true,
          stretchTriggerOffset: 100,
          expandedHeight: 150,
          backgroundColor: const Color.fromARGB(255, 240, 240, 240),
          flexibleSpace: FlexibleSpaceBar(
            background: Hero(
              tag: 'activity-hero-${activityModel.id}',
              child: Image.asset(
                'assets/img/$img',
                fit: BoxFit.cover,
                opacity: const AlwaysStoppedAnimation(.5),
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image, size: 150, color: Colors.grey);
                },
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: ListTile(
                  leading: Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/img/$img2'),
                  ),
                  title: Text(
                    "Evento: ${activityModel.event.name}",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Card(
                  child: ListTile(
                    title: Text("${activityModel.date} ${activityModel.startHour} até ${activityModel.endHour}"),
                    subtitle: Text("Local: ${activityModel.local}"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Card(
                  child: ListTile(
                    title: const Text("Palestrante:"),
                    subtitle: Text(activityModel.speaker.name),
                    trailing: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: null, icon: Icon(Icons.image)),
                        IconButton(onPressed: null, icon: Icon(Icons.image)),
                        IconButton(onPressed: null, icon: Icon(Icons.image))
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(activityModel.description),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
