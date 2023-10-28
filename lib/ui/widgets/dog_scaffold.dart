import 'package:flutter/material.dart';

class DogScaffold extends StatelessWidget {
  final Widget body;
  final String title;

  const DogScaffold({
    required this.body,
    super.key,
    this.title = 'Dog Breeds!',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.4,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: body,
      ),
    );
  }
}
