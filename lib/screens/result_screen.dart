import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';

class ResultScreen extends StatelessWidget {
  static const routeName = '/result';
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final qp = Provider.of<QuizProvider>(context, listen: false);
    final total = qp.questions.length;
    final correct = qp.correctCount;
    final percent = ((correct / total) * 100).round();
    final grade = percent >= 85 ? 'A' : percent >= 70 ? 'B' : percent >= 50 ? 'C' : 'D';
    return Scaffold(
      appBar: AppBar(title: const Text('Hasil')),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 700),
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Nama: ${qp.userName}', style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 12),
              Text('Skor: $correct / $total', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('Persentase: $percent%', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text('Grade: $grade', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: () {
                  qp.resetAll();
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                child: const Text('Ulangi Kuis'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
