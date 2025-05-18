import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: _isPlaying ? colors.error : colors.primary,
            ),
            onPressed: () {
              setState(() {
                _isPlaying = !_isPlaying;
              });
            },
            child: Text(_isPlaying ? 'Stop' : 'Play'),
          ),
        ),
      ),
    );
  }
}
