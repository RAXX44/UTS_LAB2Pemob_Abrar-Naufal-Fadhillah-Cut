import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/question_model.dart';
import '../data/sample_questions.dart';
import 'dart:convert';

class QuizProvider with ChangeNotifier {
  String userName = '';
  final List<Question> questions = sampleQuestions;
  Map<String,int> answers = {}; // questionId -> selectedIndex

  QuizProvider() {
    _loadSavedProgress();
  }

  Future<void> _loadSavedProgress() async {
    final prefs = await SharedPreferences.getInstance();
    userName = prefs.getString('userName') ?? '';
    final saved = prefs.getString('answers');
    if (saved != null) {
      final Map<String,dynamic> map = jsonDecode(saved);
      answers = map.map((k,v) => MapEntry(k, v as int));
    }
    notifyListeners();
  }

  Future<void> setUserName(String name) async {
    userName = name;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', userName);
    notifyListeners();
  }

  Future<void> selectAnswer(String questionId, int index) async {
    answers[questionId] = index;
    await _saveAnswers();
    notifyListeners();
  }

  int? selectedAnswer(String questionId) => answers[questionId];

  Future<void> _saveAnswers() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('answers', jsonEncode(answers));
  }

  int get totalCorrect {
    int score = 0;
    for (var q in questions) {
      final selected = answers[q.id];
      if (selected != null && selected == q.correctIndex) score++;
    }
    return score;
  }

  void resetQuiz() async {
    answers.clear();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('answers');
    notifyListeners();
  }
}
