import 'package:flutter/material.dart';

class EventScoreHeaderWidget extends StatelessWidget {
  final int total;

  const EventScoreHeaderWidget({required this.total, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Hero(
            tag: 'menu-hero-avatar',
            child: CircleAvatar(
                maxRadius: 40,
                child: Icon(
                  Icons.person,
                  size: 50,
                )),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Total:',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                total > 1 ? '${total.toString()} pts' : '${total.toString()} pt',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
