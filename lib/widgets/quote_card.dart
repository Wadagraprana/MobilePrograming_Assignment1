import 'package:flutter/material.dart';
import '../models/quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final VoidCallback delete;
  final VoidCallback edit;

  const QuoteCard({required this.quote, required this.delete, required this.edit, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(quote.text ?? '', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text('- ${quote.author ?? 'Unknown'}', style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(icon: const Icon(Icons.edit, color: Colors.blue), onPressed: edit),
                IconButton(icon: const Icon(Icons.delete, color: Colors.red), onPressed: delete),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
