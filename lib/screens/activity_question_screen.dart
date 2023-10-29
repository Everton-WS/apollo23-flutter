import 'package:apollo23_app/bloc/list_question_bloc.dart';
import 'package:apollo23_app/models/activity_model.dart';
import 'package:apollo23_app/models/question_model.dart';
import 'package:apollo23_app/models/user_model.dart';
import 'package:apollo23_app/widgets/question_card.dart';
import 'package:apollo23_app/widgets/question_search.dart';
import 'package:apollo23_app/widgets/user_logged_inherited.dart';
import 'package:flutter/material.dart';

class ActivityQuestionScreen extends StatefulWidget {
  final ActivityModel activityModel;

  const ActivityQuestionScreen({required this.activityModel, super.key});

  @override
  State<ActivityQuestionScreen> createState() => _ActivityQuestionScreenState();
}

class _ActivityQuestionScreenState extends State<ActivityQuestionScreen> {
  late ListQuestionBloc _bloc;

  _ActivityQuestionScreenState();

  @override
  void initState() {
    _bloc = ListQuestionBloc(widget.activityModel);
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserModel userModel = UserLoggedWidget.of(context).userLogged!;

    return Scaffold(
      appBar: AppBar(
        title: const Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(
            Icons.rocket,
            color: Colors.deepPurple,
          ),
          SizedBox(width: 10),
          Text('Perguntas')
        ]),
      ),
      body: StreamBuilder(
        stream: _bloc.listQuestionStream,
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
              itemBuilder: (context, index) => QuestionCardWidget(questionModel: snapshot.data![index]));
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: SearchWidget(onSearch: (search) {
              QuestionModel question = QuestionModel(
                  //user: UserLoggedWidget.of(context).userLogged,
                  user: userModel,
                  speakerId: '0',
                  activity: widget.activityModel,
                  questionText: search);
              _bloc.addQuestion(question);
            })),
      ),
    );
  }
}
