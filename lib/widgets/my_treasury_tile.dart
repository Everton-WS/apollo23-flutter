import 'package:flutter/material.dart';
import 'package:apollo23_app/models/my_treasury_model.dart';

class MyTreasuryTileWidget extends StatelessWidget {
  final MyTreasuryModel myTreasuryModel;

  const MyTreasuryTileWidget({required this.myTreasuryModel, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.star,
        color: Colors.amber,
        size: 30,
      ),
      isThreeLine: false,
      title: Text("${myTreasuryModel.score} moedas"),
      );
  }
}
