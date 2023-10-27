import 'dart:async';

import 'package:apollo23_app/models/activity_model.dart';
import 'package:apollo23_app/models/event_model.dart';
import 'package:apollo23_app/repositories/activity_repository.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class ListActivityBloc extends BlocBase {
  final StreamController<List<ActivityModel>> _listaController = StreamController.broadcast();

  // Getters
  Stream<List<ActivityModel>> get listActivityStream => _listaController.stream;

  Future<void> _sendList(EventModel eventModel) async {
    List<ActivityModel> list = await ActivityRepository.getAll(eventModel);
    _listaController.sink.add(list);
  }

  ListActivityBloc(EventModel eventModel) {
    _sendList(eventModel);
  }

  // Future<void> addItem(EventModel eventModel) async {
  //   await EventReposity.add(eventModel);
  //   _sendList();
  // }

  // Future<void> editItem(EventModel eventModel) async {
  //   await EventReposity.edit(eventModel);
  //   _sendList();
  // }

  // Future<void> deleteItem(EventModel eventModel) async {
  //   await EventReposity.delete(eventModel);
  //   _sendList();
  // }

  @override
  void dispose() {
    _listaController.close();
    super.dispose();
  }
}
