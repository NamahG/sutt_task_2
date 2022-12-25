import 'package:flutter/material.dart';
import 'package:sutt_task_2/main_screen.dart';
import 'auth_service.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  googleLogin() async {
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in with Google'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Google Signin'),
          onPressed: () {
            AuthService().signInWithGoogle();
          },
        ),
      ),
    );
  }
}


