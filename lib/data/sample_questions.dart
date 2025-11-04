import '../models/question_model.dart';

final List<Question> sampleQuestions = [
  Question(
    id: 'q1',
    text: 'Ibukota Indonesia adalah?',
    options: ['Jakarta', 'Bandung', 'Medan', 'Surabaya'],
    correctIndex: 0,
  ),
  Question(
    id: 'q2',
    text: 'Bahasa pemrograman utama Flutter?',
    options: ['Kotlin', 'Dart', 'Swift', 'Java'],
    correctIndex: 1,
  ),
  Question(
    id: 'q3',
    text: 'HTML singkatan dari?',
    options: ['Hyper Text Markup Language', 'Home Tool Markup Language', 'HighText Machine Language', 'None'],
    correctIndex: 0,
  ),
  Question(
    id: 'q4',
    text: 'Fungsi setState di Flutter?',
    options: ['Merebuild widget dengan state baru', 'Menghapus widget', 'Menambah package', 'Membuka file'],
    correctIndex: 0,
  ),
  Question(
    id: 'q5',
    text: 'Platform mobile milik Apple?',
    options: ['Android', 'iOS', 'Linux', 'Windows Phone'],
    correctIndex: 1,
  ),
];
