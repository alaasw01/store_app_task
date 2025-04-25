import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app_task/utils/store_app.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('login'),
      ),
      body: Center(
        child: Column(
          children: [
            InkWell(
                onTap: () => context.go(Routes.home),
                child: const Text('Go Home'))
          ],
        ),
      ),
    );
  }
}
