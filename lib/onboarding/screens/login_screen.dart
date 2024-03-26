import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibes/providers/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _signIn(WidgetRef ref) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    final authService = ref.read(authProvider);
    final user = await authService.signInWithEmail(email, password);

    if (user != null) {
      // Login successful, navigate to the next screen
    } else {
      // Login failed, show an error message
    }
  }

  void _navigateToSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(Routes.signup),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () => _signIn(ref),
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () => _navigateToSignUp(context),
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
