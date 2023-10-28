import 'package:apollo23_app/bloc/list_score_bloc.dart';
import 'package:apollo23_app/models/score_model.dart';
import 'package:apollo23_app/models/user_model.dart';
import 'package:apollo23_app/repositories/treasury_repository.dart';
import 'package:flutter/material.dart';

class ScoreScreen extends StatefulWidget {
  final UserModel userModel;

  const ScoreScreen({required this.userModel, super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  late ListScoreBloc _bloc;

  _ScoreScreenState();

  @override
  void initState() {
    _bloc = ListScoreBloc(widget.userModel);
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TreasuryRepository.getScore(widget.userModel);

    _makeActivityListTiles(Map<String, dynamic> mapActivities) {
      List<Widget> content = [];
      for (var item in mapActivities.entries) {
        content.add(ListTile(
          title: Text(item.key),
          leading: Text(
            item.value.toString(),
            textAlign: TextAlign.right,
          ),
        ));
      }
      return content;
    }

    return Scaffold(
      appBar: AppBar(title: Text('Pontuação')),
      body: StreamBuilder(
        initialData: const [],
        stream: _bloc.listScoreStream,
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
            itemBuilder: (context, index) {
              ScoreModel score = snapshot.data![index];
              return ExpansionTile(
                title: Text(score.eventName),
                leading: Text(score.eventScore.toString()),
                children: _makeActivityListTiles(score.listActivities),
              );
            },
          );
        },
      ),
    );
  }
}
