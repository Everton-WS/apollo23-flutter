import 'package:apollo23_app/models/user_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserLoggedWidget extends InheritedWidget {
  late UserModel? userLogged;

  UserLoggedWidget({this.userLogged, super.key, required super.child});

  set setUserLogged(UserModel userModel) => userLogged = userModel;

  static UserLoggedWidget? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserLoggedWidget>();
  }

  static UserLoggedWidget of(BuildContext context) {
    final UserLoggedWidget? result = maybeOf(context);
    assert(result != null, 'No user found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(UserLoggedWidget oldWidget) => oldWidget.userLogged!.email != userLogged!.email;
}
