import 'package:apollo23_app/models/event_model.dart';
import 'package:apollo23_app/screens/event_activity_screen.dart';
import 'package:apollo23_app/screens/event_faq_screen.dart';
import 'package:apollo23_app/screens/event_info_screen.dart';
import 'package:apollo23_app/widgets/treasury_scanner.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatefulWidget {
  final EventModel eventModel;

  const EventScreen({required this.eventModel, super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  int _selectedIndex = 0;

  void _itemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> options = [
      EventInfoScreen(eventModel: widget.eventModel),
      EventActivityScreen(eventModel: widget.eventModel),
      EventFaqScreen(eventModel: widget.eventModel),
    ];
    return Scaffold(
      body: options.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(onTap: _itemTap, currentIndex: _selectedIndex, items: const [
        BottomNavigationBarItem(icon: Icon(Icons.info_outlined), label: 'Info'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Atividades'),
        BottomNavigationBarItem(icon: Icon(Icons.question_answer), label: 'FAQ'),
      ]),
      floatingActionButton: FloatingActionButton(
          key: const ValueKey('qrcode_event'),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TreasuryScannerWidget()));
          },
          child: const Icon(Icons.qr_code_scanner)),
    );
  }
}
