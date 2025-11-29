import 'package:flutter/material.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  final List<Map<String, dynamic>> _appointments = [];

  void _addDummy() {
    setState(() {
      _appointments.add({
        'when': DateTime.now().add(const Duration(days: 3)),
        'doctor': 'Dr. Smith',
        'note': 'Follow-up'
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Appointments')),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: _addDummy, child: const Text('Add dummy appointment')),
          Expanded(
            child: ListView.builder(
              itemCount: _appointments.length,
              itemBuilder: (context, i) {
                final a = _appointments[i];
                return ListTile(
                  title: Text(a['doctor']),
                  subtitle: Text('${a['when']} - ${a['note']}'),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
