import 'package:flutter/material.dart';

class SymptomsPage extends StatefulWidget {
  const SymptomsPage({super.key});

  @override
  State<SymptomsPage> createState() => _SymptomsPageState();
}

class _SymptomsPageState extends State<SymptomsPage> {
  final List<Map<String, dynamic>> _entries = [];
  final _controller = TextEditingController();

  void _addEntry() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _entries.add({'text': text, 'severity': 1, 'time': DateTime.now()});
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Symptom Tracker')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                      controller: _controller,
                      decoration:
                          const InputDecoration(hintText: 'Add symptom')),
                ),
                IconButton(onPressed: _addEntry, icon: const Icon(Icons.add)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _entries.length,
              itemBuilder: (context, i) {
                final e = _entries[i];
                return ListTile(
                  title: Text(e['text']),
                  subtitle: Text('${e['time']} • severity: ${e['severity']}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
