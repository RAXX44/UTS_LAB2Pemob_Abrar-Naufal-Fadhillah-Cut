import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/question_card.dart';
import '../widgets/primary_button.dart';
import '../models/question_model.dart';

class QuizScreen extends StatelessWidget {
  static const routeName = '/quiz';

  @override
  Widget build(BuildContext context) {
    final qp = Provider.of<QuizProvider>(context);
    final questions = qp.questions;
    return Scaffold(
      appBar: AppBar(title: Text('Kuis')),
      body: LayoutBuilder(builder: (context, constraints) {
        final isWide = constraints.maxWidth > 800;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: isWide ? 80 : 8, vertical: 12),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: questions.length,
                  itemBuilder: (context, idx) {
                    final Question q = questions[idx];
                    return QuestionCard(
                      question: q,
                      selectedIndex: qp.selectedAnswer(q.id),
                      onSelect: (i) => qp.selectAnswer(q.id, i),
                    );
                  },
                ),
              ),
              SizedBox(height: 8),
              PrimaryButton(
                text: 'Selesai & Lihat Hasil',
                onPressed: () {
                  final unanswered = questions.where((q) => qp.selectedAnswer(q.id) == null).toList();
                  if (unanswered.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Anda belum menjawab semua pertanyaan.')));
                    return;
                  }
                  Navigator.pushNamed(context, '/result');
                },
              ),
              SizedBox(height: 12),
            ],
          ),
        );
      }),
    );
  }
}
