import 'package:flutter/material.dart';
import '../models/question_model.dart';
import 'answer_tile.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  final int? selectedIndex;
  final Function(int) onSelect;

  const QuestionCard({required this.question, required this.selectedIndex, required this.onSelect, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(question.question, style: TextStyle(fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w600)),
            SizedBox(height: 12),
            ...List.generate(question.options.length, (i) {
              return AnswerTile(
                text: question.options[i],
                selected: selectedIndex == i,
                onTap: () => onSelect(i),
              );
            })
          ],
        ),
      ),
    );
  }
}
