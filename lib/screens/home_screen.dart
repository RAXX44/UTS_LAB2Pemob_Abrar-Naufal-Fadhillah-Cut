import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/primary_button.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _ctrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    final qp = Provider.of<QuizProvider>(context, listen: false);
    _ctrl.text = qp.userName;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    final mq = MediaQuery.of(context);
    final isWide = mq.size.width > 800;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 900),
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  IconButton(
                    onPressed: () => theme.toggle(),
                    icon: Icon(theme.isDark ? Icons.dark_mode : Icons.light_mode),
                    tooltip: 'Toggle theme',
                  ),
                  Image.asset('assets/images/logo.png', width: isWide ? 160 : 100),
                ]),
                const SizedBox(height: 20),
                const Text('Selamat datang di Kuis Pilihan Ganda', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                const SizedBox(height: 14),
                TextField(
                  controller: _ctrl,
                  decoration: const InputDecoration(labelText: 'Masukkan nama Anda', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 12),
                PrimaryButton(label: 'Mulai Kuis', onPressed: () {
                  final name = _ctrl.text.trim();
                  if (name.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Nama tidak boleh kosong')));
                    return;
                  }
                  Provider.of<QuizProvider>(context, listen: false).setUserName(name);
                  Navigator.pushNamed(context, '/quiz');
                }),
                const SizedBox(height: 10),
                const Text('Petunjuk: Jawab semua pertanyaan. Progress disimpan otomatis.'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
