import 'package:apollo23_app/models/question_model.dart';
import 'package:flutter/material.dart';

class QuestionCardWidget extends StatelessWidget {
  final QuestionModel questionModel;

  const QuestionCardWidget({required this.questionModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  questionModel.questionText,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    questionModel.user.name,
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
