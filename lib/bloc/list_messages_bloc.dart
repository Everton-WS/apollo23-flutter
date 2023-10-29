import 'dart:async';

import 'package:apollo23_app/models/event_model.dart';
import 'package:apollo23_app/models/message_model.dart';
import 'package:apollo23_app/repositories/event_repository.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class ListMessagesBloc extends BlocBase {
  final StreamController<List<MessageModel>> _listController = StreamController.broadcast();

  Stream<List<MessageModel>> get listMessageStream => _listController.stream;

  Future<void> _sendList(EventModel eventModel) async {
    List<MessageModel> list = await EventRepository.getMessages(eventModel);
    _listController.sink.add(list);
  }

  ListMessagesBloc(EventModel eventModel) {
    _sendList(eventModel);
  }

  @override
  void dispose() {
    _listController.close();
    super.dispose();
  }
}
