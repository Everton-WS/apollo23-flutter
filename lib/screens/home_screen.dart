import 'package:apollo23_app/bloc/list_event_bloc.dart';
import 'package:apollo23_app/main.dart';
import 'package:apollo23_app/models/user_model.dart';
import 'package:apollo23_app/screens/score_screen.dart';
import 'package:apollo23_app/widgets/event_card.dart';
import 'package:apollo23_app/widgets/treasury_scanner.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final UserModel userModel;

  const HomeScreen({required this.userModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.rocket,
          color: Colors.deepPurple,
        ),
        title: const Text('Meus eventos'),
        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
        actions: [
          PopupMenuButton(
            position: PopupMenuPosition.under,
            elevation: 5,
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ScoreScreen(userModel: userModel),
                  )),
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text('Pontuação'),
                    Icon(
                      Icons.add_chart,
                    )
                  ]),
                ),
                PopupMenuItem(
                    onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const EventManager(),
                        )),
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text('Logout'),
                      Icon(
                        Icons.logout,
                        color: Colors.red,
                      )
                    ]))
              ];
            },
            icon: const Hero(tag: 'menu-hero-avatar', child: CircleAvatar(child: Icon(Icons.person))),
          ),
        ],
      ),
      body: StreamBuilder(
        initialData: const [],
        stream: BlocProvider.getBloc<ListEventBloc>().listEventStream,
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
              itemBuilder: (context, index) => EventCardWidget(eventModel: snapshot.data![index]));
        },
      ),
      floatingActionButton: FloatingActionButton(
        key: const ValueKey('qrcode_home'),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TreasuryScannerWidget()));
        },
        child: const Icon(Icons.qr_code_scanner_outlined),
      ),
    );
  }
}
