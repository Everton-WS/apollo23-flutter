import 'package:apollo23_app/models/user_model.dart';
import 'package:flutter/material.dart';

class UserLoggedWidget extends InheritedWidget {
  final UserModel userLogged;

  UserLoggedWidget({required this.userLogged, super.key, required super.child}) {
    print(userLogged);
  }

  static UserLoggedWidget? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserLoggedWidget>();
  }

  static UserLoggedWidget of(BuildContext context) {
    final UserLoggedWidget? result = maybeOf(context);
    assert(result != null, 'No user found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(UserLoggedWidget oldWidget) => oldWidget.userLogged.email != userLogged.email;
}
