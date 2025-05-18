import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:simple_synth/web_audio.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _audioContext = AudioContext();

  bool _isInitialized = false;
  bool _isPlaying = false;

  Future<void> _setUpAudio() async {
    _audioContext.createOscillator()
      ..type = 'sine'
      ..frequency.setValueAtTime(440, _audioContext.currentTime)
      ..connect(_audioContext.destination)
      ..start();
    await _audioContext.suspend().toDart;
    setState(() {
      _isInitialized = true;
    });
  }

  Future<void> _toggleAudio() async {
    switch (_audioContext.state) {
      case 'suspended':
        await _audioContext.resume().toDart;
      case 'running':
        await _audioContext.suspend().toDart;
      default:
        throw StateError(
          'AudioContext is in unknown state: ${_audioContext.state}',
        );
    }

    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  void dispose() {
    _audioContext.close();
    super.dispose();
  }

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
            onPressed: () async {
              if (!_isInitialized) {
                await _setUpAudio();
              }
              await _toggleAudio();
            },
            child: Text(_isPlaying ? 'Stop' : 'Play'),
          ),
        ),
      ),
    );
  }
}
