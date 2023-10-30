import 'dart:async';

import 'package:apollo23_app/models/score_model.dart';
import 'package:apollo23_app/models/user_model.dart';
import 'package:apollo23_app/repositories/treasury_repository.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class ListScoreBloc extends BlocBase {
  final StreamController<List<ScoreModel>> _listController = StreamController.broadcast();

  Stream<List<ScoreModel>> get listScoreStream => _listController.stream;

  Future<void> _sendList(UserModel userModel) async {
    List<ScoreModel> list = await TreasuryRepository.getScore(userModel);
    _listController.sink.add(list);
  }

  ListScoreBloc(UserModel userModel) {
    _sendList(userModel);
  }

  @override
  void dispose() {
    _listController.close();
    super.dispose();
  }
}
