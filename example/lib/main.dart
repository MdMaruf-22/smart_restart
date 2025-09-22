import 'dart:math';
import 'package:flutter/material.dart';
import 'package:smart_restart/smart_restart.dart';

void main() => runApp(const MyApp());

class AppSession {
  AppSession._() : id = Random().nextInt(1 << 31), startedAt = DateTime.now();
  static final instance = AppSession._();
  final int id;
  final DateTime startedAt;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final s = AppSession.instance;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('smart_restart example')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Session ID: ${s.id}'),
              const SizedBox(height: 8),
              Text('Started At: ${s.startedAt.toLocal()}'),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  await SmartRestart.restart();
                },
                child: const Text('Restart App'),
              ),
              const SizedBox(height: 12),
              const Text(
                'Hot Reload → no change.\nRestart button → new Session ID & time.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
