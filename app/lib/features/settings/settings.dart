import 'package:flutter/material.dart';
import 'package:flutter_rust/utils/constants.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: md, horizontal: rl),
          child: Column(
            children: [
              Text("Settings"),
            ],
          ),
        ),
      ),
    );
  }
}
