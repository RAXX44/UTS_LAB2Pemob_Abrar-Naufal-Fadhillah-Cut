import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/question_model.dart';
import '../data/sample_questions.dart';

class QuizProvider with ChangeNotifier {
  String userName = '';
  final List<Question> questions = sampleQuestions;
  final Map<String,int> answers = {};

  QuizProvider() {
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    userName = prefs.getString('userName') ?? '';
    final s = prefs.getString('answers');
    if (s != null) {
      final Map<String,dynamic> m = jsonDecode(s);
      m.forEach((k,v) => answers[k] = v as int);
    }
    notifyListeners();
  }

  Future<void> setUserName(String name) async {
    userName = name;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
    notifyListeners();
  }

  Future<void> selectAnswer(String qid, int idx) async {
    answers[qid] = idx;
    await _save();
    notifyListeners();
  }

  int? selected(String qid) => answers[qid];

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('answers', jsonEncode(answers));
  }

  int get correctCount {
    int c = 0;
    for (var q in questions) {
      final sel = answers[q.id];
      if (sel != null && sel == q.correctIndex) c++;
    }
    return c;
  }

  void resetAll() async {
    answers.clear();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('answers');
    await prefs.remove('userName');
    userName = '';
    notifyListeners();
  }
}
