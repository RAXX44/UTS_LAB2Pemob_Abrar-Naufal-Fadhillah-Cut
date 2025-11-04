import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/primary_button.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final qp = Provider.of<QuizProvider>(context, listen: false);
    _controller.text = qp.userName;
  }

  @override
  Widget build(BuildContext context) {
    final themeProv = Provider.of<ThemeProvider>(context);
    final mq = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 18),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/header_bg.png'),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.05), BlendMode.dstATop),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(themeProv.isDark ? Icons.dark_mode : Icons.light_mode),
                      onPressed: () => themeProv.toggleTheme(),
                    ),
                    Image.asset('assets/images/logo.png', width: mq.size.width * 0.2),
                  ],
                ),
                SizedBox(height: 20),
                Text('Selamat datang di Kuis Pilihan Ganda', style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                SizedBox(height: 16),
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(labelText: 'Masukkan nama Anda', border: OutlineInputBorder()),
                ),
                SizedBox(height: 16),
                PrimaryButton(
                  text: 'Mulai Kuis',
                  onPressed: () {
                    final name = _controller.text.trim();
                    if (name.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Nama tidak boleh kosong')));
                      return;
                    }
                    Provider.of<QuizProvider>(context, listen: false).setUserName(name);
                    Navigator.pushNamed(context, '/quiz');
                  },
                ),
                SizedBox(height: 20),
                Text('Petunjuk: Jawab semua pertanyaan. Progress tersimpan saat rotasi/perpindahan halaman.', textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
