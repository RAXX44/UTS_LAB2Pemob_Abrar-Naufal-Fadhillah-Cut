import '../models/question_model.dart';

final List<Question> sampleQuestions = [
  Question(
    id: 'q1',
    question: 'Ibukota Indonesia adalah?',
    options: ['Jakarta', 'Bandung', 'Medan', 'Surabaya'],
    correctIndex: 0,
  ),
  Question(
    id: 'q2',
    question: 'Bahasa pemrograman yang populer untuk Flutter?',
    options: ['Kotlin', 'Dart', 'Swift', 'Java'],
    correctIndex: 1,
  ),
  Question(
    id: 'q3',
    question: 'HTML singkatan dari?',
    options: ['Hyper Text Markup Language', 'Hyperlink Machine Language', 'Home Tool Markup Language', 'None'],
    correctIndex: 0,
  ),
  Question(
    id: 'q4',
    question: 'Sistem operasi di ponsel Android berbasis?',
    options: ['Linux', 'Windows', 'iOS', 'macOS'],
    correctIndex: 0,
  ),
  Question(
    id: 'q5',
    question: 'Fungsi setState di Flutter?',
    options: ['Merebuild widget dengan state baru', 'Menghapus widget', 'Menambah package', 'Membuka file'],
    correctIndex: 0,
  ),
];
