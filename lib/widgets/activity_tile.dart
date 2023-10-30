import 'package:flutter/material.dart';
import 'package:apollo23_app/models/activity_model.dart';
import 'package:apollo23_app/screens/activity_screen.dart';

class ActivityTileWidget extends StatelessWidget {
  final ActivityModel activityModel;

  const ActivityTileWidget({required this.activityModel, super.key});

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
    return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ActivityScreen(activityModel: activityModel),
        ));
      },
      leading: Hero(
        tag: 'activity-hero-${activityModel.id}',
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Image(
            width: 75,
            fit: BoxFit.fill,
            image: AssetImage('assets/img/$img'),
            errorBuilder: (context, error, stackTrace) {
              return const Icon(
                Icons.image,
                size: 75,
              );
            },
          ),
        ),
      ),
      isThreeLine: true,
      title: Text("${activityModel.type}${activityModel.title}", style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('${activityModel.speaker.name} \n${activityModel.local}'),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(activityModel.date),
          Text('Início: ${activityModel.startHour}'),
          Text('Fim: ${activityModel.endHour}'),
        ],
      ),
    );
  }
}
