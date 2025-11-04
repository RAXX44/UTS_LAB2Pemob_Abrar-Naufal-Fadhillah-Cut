import 'package:flutter/material.dart';
import '../models/question_model.dart';
import 'answer_tile.dart';

class QuestionCard extends StatelessWidget {
  final Question q;
  final int? selectedIndex;
  final void Function(int) onSelect;
  const QuestionCard({required this.q, required this.selectedIndex, required this.onSelect, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(q.text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            ...List.generate(q.options.length, (i) {
              return AnswerTile(
                text: q.options[i],
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
