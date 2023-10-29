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

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _itemTap(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index, duration: const Duration(milliseconds: 750), curve: Curves.easeInOut);
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
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() => _selectedIndex = value);
        },
        children: options,
      ),
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
