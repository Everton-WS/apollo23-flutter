import 'dart:async';

import 'package:apollo23_app/models/activity_model.dart';
import 'package:apollo23_app/models/question_model.dart';
import 'package:apollo23_app/repositories/activity_repository.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class ListQuestionBloc extends BlocBase {
  final StreamController<List<QuestionModel>> _listaController = StreamController.broadcast();
  final ActivityRepository activityRepository = ActivityRepository();

  Stream<List<QuestionModel>> get listQuestionStream => _listaController.stream;

  Future<void> _sendList(ActivityModel activityModel) async {
    List<QuestionModel> list = await activityRepository.getQuestions(activityModel);
    _listaController.sink.add(list);
  }

  ListQuestionBloc(ActivityModel activityModel) {
    _sendList(activityModel);
  }

  Future<void> addQuestion(QuestionModel questionModel) async {
    await activityRepository.addQuestion(questionModel);
    _sendList(questionModel.activity);
  }

  @override
  void dispose() {
    _listaController.close();
    super.dispose();
  }
}
