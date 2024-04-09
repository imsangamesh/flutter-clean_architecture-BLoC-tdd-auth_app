import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 10),
            Text('$message...'),
          ],
        ),
      ),
    );
  }
}
