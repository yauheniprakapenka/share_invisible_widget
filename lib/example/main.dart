// ignore_for_file: prefer-match-file-name

import 'package:flutter/material.dart';

import '../widget_share.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await shareInvisibleWidgetAsImage(
                context: context,
                fileName: '${DateTime.now().millisecondsSinceEpoch}',
                invisibleWidget: const SomeWidget(isInvisible: true),
              );
            },
            child: const Text('Share invisible widget'),
          ),
        ),
      ),
    );
  }
}

class SomeWidget extends StatelessWidget {
  final bool isInvisible;

  const SomeWidget({
    super.key,
    this.isInvisible = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isInvisible ? 300.0 : null,
      color: Colors.white,
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
              100,
              (int index) => Row(
                children: [
                  const Text('value'),
                  const Spacer(),
                  Text(index.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
