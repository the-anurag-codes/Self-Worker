import 'package:flutter/material.dart';
import 'package:self_worker/auth/login_screen.dart';
import 'package:self_worker/auth/signup_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLoggedIn = true;

  @override
  Widget build(BuildContext context) {
    return isLoggedIn
        ?  LogIn(
      onClickedJoinNow: ()=>toggle,
    )
        : SignUp(
      onClickedSignIn: ()=>toggle,
    );
  }

  void toggle() => setState(() => isLoggedIn = !isLoggedIn);
}
