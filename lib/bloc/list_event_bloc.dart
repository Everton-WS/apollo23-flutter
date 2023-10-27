import 'dart:async';

import 'package:apollo23_app/models/event_model.dart';
import 'package:apollo23_app/repositories/event_repository.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class ListEventBloc extends BlocBase {
  final StreamController<List<EventModel>> _listaController = StreamController.broadcast();

  // Getters
  Stream<List<EventModel>> get listEventStream => _listaController.stream;

  Future<void> _sendList() async {
    List<EventModel> list = await EventRepository.getAll();
    _listaController.sink.add(list);
  }

  ListEventBloc() {
    _sendList();
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
