import 'package:apollo23_app/models/activity_model.dart';
import 'package:apollo23_app/screens/activity_info_screen.dart';
import 'package:apollo23_app/screens/activity_question_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/treasury_scanner.dart';

class ActivityScreen extends StatefulWidget {
  final ActivityModel activityModel;

  const ActivityScreen({required this.activityModel, super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
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
      ActivityInfoScreen(activityModel: widget.activityModel),
      ActivityQuestionScreen(activityModel: widget.activityModel),
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
        BottomNavigationBarItem(icon: Icon(Icons.info_outline), label: 'Info'),
        BottomNavigationBarItem(icon: Icon(Icons.question_mark_rounded), label: 'Perguntas'),
      ]),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              key: const ValueKey('qrcode_activity'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TreasuryScannerWidget()));
              },
              child: const Icon(Icons.qr_code_scanner))
          : null,
    );
  }
}
