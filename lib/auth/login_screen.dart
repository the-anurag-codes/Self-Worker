import 'package:flutter/material.dart';
import 'package:self_worker/auth/forgot_password_screen.dart';
import 'package:self_worker/components/components.dart';
import 'package:self_worker/components/constants.dart';
import 'package:self_worker/components/home_screen_components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:self_worker/components/utils.dart';

class LogIn extends StatefulWidget {
  final VoidCallback onClickedJoinNow;

  const LogIn({Key? key, required this.onClickedJoinNow}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> signIn() async {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
          child: CircularProgressIndicator(),
        ),
      );

      try {
        await _auth.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } on FirebaseAuthException catch (e) {
        print(e.toString());

        Utils.showSnackBar(e.message);
      }

      Navigator.of(context).pop();
    }

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: animatedText("Self-Worker", 52),
                    ),
                    const SizedBox(
                      height: 50,
                    ),

                    Text(
                      "EMAIL ADDRESS",
                      style: kLoginTextStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      validator: (String? value) {
                        if (value == null) {
                          return 'Email is Required';
                        }

                        if (!RegExp(
                                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                            .hasMatch(value)) {
                          return 'Please enter a valid email Address';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Text(
                      "PASSWORD",
                      style: kLoginTextStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.always,
                      validator: (String? value) {
                        if (value == null) {
                          return "Password is required";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),

                    // BUTTON
                    logInSignUpButton(
                      "LOG IN",
                      Icons.arrow_forward_rounded,
                      context,
                      () => signIn(),
                    ),

                    // OR DIVIDER
                    kDivider,

                    logInSignUpButton(
                      "Google",
                      Icons.arrow_forward_rounded,
                      context,
                      () => signIn(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Container(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                            text: "New to Self-Worker? ",
                            style: TextStyle(fontSize: 18),
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = widget.onClickedJoinNow,
                                text: "Join now",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]),
                      ),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
