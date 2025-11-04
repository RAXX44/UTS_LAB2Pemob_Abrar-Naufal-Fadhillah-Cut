import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/question_card.dart';
import '../widgets/primary_button.dart';

class QuizScreen extends StatelessWidget {
  static const routeName = '/quiz';
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final qp = Provider.of<QuizProvider>(context);
    final questions = qp.questions;
    return Scaffold(
      appBar: AppBar(title: const Text('Kuis')),
      body: LayoutBuilder(builder: (context, constraints) {
        final isWide = constraints.maxWidth > 800;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: isWide ? 60 : 12, vertical: 12),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: questions.length,
                  itemBuilder: (context, idx) {
                    final q = questions[idx];
                    return QuestionCard(
                      q: q,
                      selectedIndex: qp.selected(q.id),
                      onSelect: (i) => qp.selectAnswer(q.id, i),
                    );
                  },
                ),
              ),
              const SizedBox(height: 6),
              PrimaryButton(label: 'Selesai & Lihat Hasil', onPressed: () {
                final notAnswered = questions.where((q) => qp.selected(q.id) == null).toList();
                if (notAnswered.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Anda belum menjawab semua pertanyaan.')));
                  return;
                }
                Navigator.pushNamed(context, '/result');
              }),
              const SizedBox(height: 12),
            ],
          ),
        );
      }),
    );
  }
}
