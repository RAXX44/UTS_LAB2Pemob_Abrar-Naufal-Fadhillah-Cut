import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';

class ResultScreen extends StatelessWidget {
  static const routeName = '/result';

  @override
  Widget build(BuildContext context) {
    final qp = Provider.of<QuizProvider>(context, listen: false);
    final total = qp.questions.length;
    final correct = qp.totalCorrect;
    final percent = (correct / total * 100).round();
    String grade;
    if (percent >= 85) grade = 'A';
    else if (percent >= 70) grade = 'B';
    else if (percent >= 50) grade = 'C';
    else grade = 'D';

    return Scaffold(
      appBar: AppBar(title: Text('Hasil')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Nama: ${qp.userName}', style: TextStyle(fontFamily: 'Poppins', fontSize: 18)),
              SizedBox(height: 12),
              Text('Skor: $correct / $total', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
              SizedBox(height: 8),
              Text('Persentase: $percent%', style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Text('Grade: $grade', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              SizedBox(height: 18),
              ElevatedButton(
                onPressed: () {
                  qp.resetQuiz();
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                child: Text('Ulangi Kuis'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
