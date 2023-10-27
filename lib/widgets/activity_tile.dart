import 'package:flutter/material.dart';
import 'package:apollo23_app/models/activity_model.dart';
import 'package:apollo23_app/screens/activity_screen.dart';

class ActivityTileWidget extends StatelessWidget {
  final ActivityModel activityModel;

  const ActivityTileWidget({required this.activityModel, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ActivityScreen(activityModel: activityModel),
        ));
      },
      leading: Hero(
        tag: 'activity-hero-${activityModel.id}',
        child: const Icon(
          Icons.image,
          size: 50,
        ),
      ),
      isThreeLine: true,
      titleAlignment: ListTileTitleAlignment.titleHeight,
      title: Text("${activityModel.type} ${activityModel.title}"),
      subtitle: Text('${activityModel.speaker.name} \n${activityModel.local}'),
//      title: Expanded (
//        child : ActivityDescription(activityModel: activityModel,),),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(activityModel.date),
          Text('Início: ${activityModel.startHour}'),
          Text('Fim: ${activityModel.endHour}'),
//          Text(activityModel.local),
        ],
      ),
    );
  }
}
