import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_1/services/game_service.dart';

class GameButtons extends StatefulWidget {
  const GameButtons({super.key});

  @override
  State<GameButtons> createState() => _GameButtonsState();
}

class _GameButtonsState extends State<GameButtons> with TickerProviderStateMixin {
  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Animasi shaking
    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _shakeController.reset();
      }
    });

    _shakeAnimation = Tween<double>(begin: 0, end: 10)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(_shakeController);

    // Animasi scaling
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 1.0,
      upperBound: 1.2, // Membesar 20%
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _scaleController.reverse();
      }
    });

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2)
        .chain(CurveTween(curve: Curves.easeOut))
        .animate(_scaleController);
  }

  @override
  Widget build(BuildContext context) {
    final gameService = Provider.of<GameService>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildAnimatedButton("Food", gameService, gameService.foodButtonColor),
        _buildAnimatedButton("Scenery", gameService, gameService.sceneryButtonColor),
        _buildAnimatedButton("People", gameService, gameService.peopleButtonColor),
      ],
    );
  }

  Widget _buildAnimatedButton(String category, GameService gameService, Color color) {
    bool shouldShake = gameService.isShaking && gameService.selectedCategory == category;
    bool shouldScale = gameService.isScaling && gameService.selectedCategory == category;

    return AnimatedBuilder(
      animation: shouldScale ? _scaleAnimation : _shakeAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(shouldShake ? _shakeAnimation.value : 0, 0),
          child: Transform.scale(
            scale: shouldScale ? _scaleAnimation.value : 1.0,
            child: ElevatedButton(
              onPressed: () {
                gameService.checkAnswer(category, _shakeController, _scaleController);
              },
              style: ElevatedButton.styleFrom(backgroundColor: color),
              child: Text(category),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _shakeController.dispose();
    _scaleController.dispose();
    super.dispose();
  }
}
