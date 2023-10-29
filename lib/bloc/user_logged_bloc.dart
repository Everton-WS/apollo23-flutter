import 'dart:async';

import 'package:apollo23_app/models/user_model.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class UserLoggedBloc extends BlocBase {
  final StreamController<UserModel> _userController = StreamController.broadcast();

  Stream<UserModel> get userLogged => _userController.stream;

  void setUserLogged(UserModel user) {
    print('setando usuario logado');
    _userController.add(user);
  }

  @override
  void dispose() {
    _userController.close();
    super.dispose();
  }
}
