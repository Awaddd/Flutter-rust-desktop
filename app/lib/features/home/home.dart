import 'package:flutter/material.dart';
import 'package:flutter_rust/components/atoms/button.dart';
import 'package:flutter_rust/utils/constants.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: md, horizontal: rl),
          child: Column(
            children: [
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Bookio", style: Theme.of(context).textTheme.headlineMedium),
                ],
              ),

              const Spacer(),

              Button(
                onPressed: () => context.go('/settings'),
                text: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
