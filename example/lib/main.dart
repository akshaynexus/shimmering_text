import 'package:flutter/material.dart';
import 'package:shimmering_text/shimmering_text.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'shimmering_text example',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: const Text('shimmering_text')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShimmeringText(
                'Thinking…',
                baseColor: Colors.grey.shade600,
                highlightColor: Colors.white,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 32),
              Shimmer(
                baseColor: Colors.grey.shade700,
                highlightColor: Colors.tealAccent,
                child: const Icon(Icons.auto_awesome, size: 48),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
