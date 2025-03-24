import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_1/services/game_service.dart';
import 'package:testing_1/widgets/game_buttons.dart';
import 'package:testing_1/widgets/image_display.dart';
import 'package:testing_1/widgets/quote_card.dart';
import 'package:testing_1/models/quote.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Quote? editingQuote;
  final TextEditingController textController = TextEditingController();
  final TextEditingController authorController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GameService>(context, listen: false).resetGame();
    });
  }

  void _addOrUpdateQuote(GameService gameService) {
    if (textController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Quote cannot be empty!'), backgroundColor: Colors.red),
      );
      return;
    }

    setState(() {
      if (editingQuote != null) {
        editingQuote!.text = textController.text.trim();
        editingQuote!.author = authorController.text.trim().isEmpty ? 'Unknown' : authorController.text.trim();
        editingQuote = null;
      } else {
        gameService.quotes.add(Quote(
          text: textController.text.trim(),
          author: authorController.text.trim().isEmpty ? 'Unknown' : authorController.text.trim(),
        ));
      }

      textController.clear();
      authorController.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Quote added successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final gameService = Provider.of<GameService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Game & Quotes', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ImageDisplay(imagePath: gameService.currentImage),
              const SizedBox(height: 20),
              const GameButtons(),  // Tidak perlu `gameService`
              const SizedBox(height: 20),
              Text(
                'Correct: ${gameService.correctCount} | Wrong: ${gameService.wrongCount}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => gameService.resetGame(),
                child: const Text('Reset Game'),
              ),
              const SizedBox(height: 20),
              TextField(controller: textController, decoration: const InputDecoration(labelText: 'Quote Text')),
              TextField(controller: authorController, decoration: const InputDecoration(labelText: 'Author')),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _addOrUpdateQuote(gameService),
                child: Text(editingQuote != null ? 'Update Quote' : 'Add Quote'),
              ),
              const SizedBox(height: 20),
              Column(
                children: gameService.quotes.map((quote) => QuoteCard(
                  quote: quote,
                  delete: () {
                    gameService.quotes.remove(quote);
                    gameService.notifyListeners();
                  },
                  edit: () {
                    setState(() {
                      editingQuote = quote;
                      textController.text = quote.text ?? '';
                      authorController.text = quote.author ?? '';
                    });
                  },
                )).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
