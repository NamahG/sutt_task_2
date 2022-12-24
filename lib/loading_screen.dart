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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainScreen(),
              ));
          },
        ),
      ),
    );
  }
}

// AuthService().signInWithGoogle();
// import 'package:flutter_spinkit/flutter_spinkit.dart';


// class LoadingScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _LoadingScreenState();
//   }
// }
//
// class _LoadingScreenState extends State<LoadingScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // body: Center(
//       //   child: SpinKitDoubleBounce(
//       //     color: Colors.white,
//       //     size: 100.0,
//       //   ),
//       // ),
//     );
//   }
// }