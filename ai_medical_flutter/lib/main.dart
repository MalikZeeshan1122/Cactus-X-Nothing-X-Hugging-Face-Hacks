import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'pages/login_page.dart';
import 'pages/chat_page.dart';
import 'pages/symptoms_page.dart';
import 'pages/appointments_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  runApp(const AIMedicalApp());
}

class AIMedicalApp extends StatelessWidget {
  const AIMedicalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Medical Assistant',
      theme: ThemeData(primarySwatch: Colors.teal),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/chat': (context) => const ChatPage(),
        '/symptoms': (context) => const SymptomsPage(),
        '/appointments': (context) => const AppointmentsPage(),
      },
    );
  }
}
