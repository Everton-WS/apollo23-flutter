import 'package:apollo23_app/bloc/list_event_bloc.dart';
import 'package:apollo23_app/bloc/user_logged_bloc.dart';
import 'package:apollo23_app/screens/login_screen.dart';
import 'package:apollo23_app/widgets/user_logged_inherited.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EventManager());
}

class EventManager extends StatelessWidget {
  const EventManager({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [Bloc((i) => ListEventBloc()), Bloc((i) => UserLoggedBloc())],
      dependencies: const [],
      child: UserLoggedWidget(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
          home: const LoginScreen(),
        ),
      ),
    );
  }
}
