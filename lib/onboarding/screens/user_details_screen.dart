import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vibes/providers/auth_provider.dart';
import 'package:vibes/routes.dart';

class UserDetailScreen extends ConsumerWidget {
  UserDetailScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController nodeAddressController = TextEditingController();
  final TextEditingController profilePicURLController = TextEditingController();

  void _signUp(WidgetRef ref, BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String phone = phoneController.text.trim();
    String address = addressController.text.trim();
    String nodeAddress = nodeAddressController.text.trim();
    String profilePicURL = profilePicURLController.text.trim();

    final authService = ref.read(authProvider);
    final user = await authService.signUpWithEmail(
      email,
      password,
      firstName,
      lastName,
      phone,
      address,
      nodeAddress,
      profilePicURL,
    );

    if (user != null) {
      if (context.mounted) {
        // Signup successful, navigate to the login screen
        _navigateToLogin(context);
      }
    } else {
      // Signup failed, show an error message
    }
  }

  void _navigateToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.login);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(8.0),
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
          TextField(
            controller: firstNameController,
            decoration: InputDecoration(labelText: 'First Name'),
          ),
          TextField(
            controller: lastNameController,
            decoration: InputDecoration(labelText: 'Last Name'),
          ),
          TextField(
            controller: phoneController,
            decoration: InputDecoration(labelText: 'Phone'),
          ),
          TextField(
            controller: addressController,
            decoration: InputDecoration(labelText: 'Address'),
          ),
          TextField(
            controller: nodeAddressController,
            decoration: InputDecoration(labelText: 'Node Address'),
          ),
          TextField(
            controller: profilePicURLController,
            decoration: InputDecoration(labelText: 'Profile Picture URL'),
          ),
          ElevatedButton(
            onPressed: () => _signUp(ref, context),
            child: Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}
