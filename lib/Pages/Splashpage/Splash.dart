// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Splash Page",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Column(children: [
          
        ],
      ),
    );
  }
}
