import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:self_worker/components/components.dart';
import 'package:self_worker/components/constants.dart';
import 'package:self_worker/components/home_screen_components.dart';
import 'package:self_worker/components/utils.dart';

class SignUp extends StatefulWidget {
  final VoidCallback onClickedSignIn;

  const SignUp({Key? key, required this.onClickedSignIn}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // SIGNUP FUNCTION
    Future signUp() async {
      final isValid = _formKey.currentState!.validate();
      if (!isValid) return;

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );

      try {
        await _auth.createUserWithEmailAndPassword(
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
                    Center(
                      child: animatedText("Self-Worker", 52),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "FULL NAME",
                      style: kLoginTextStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (name) =>
                          name == null ? "Name is required" : null,
                    ),
                    const SizedBox(
                      height: 20,
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) => email != null &&
                              (!RegExp(
                                      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                  .hasMatch(email))
                          ? 'Please enter a valid email Address'
                          : null,
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (password) =>
                          password != null && password.length < 6
                              ? " Enter min. six characters"
                              : null,
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    // BUTTON
                    logInSignUpButton(
                      "SIGN UP",
                      Icons.arrow_forward_rounded,
                      context,
                      () => signUp(),
                    ),

                    // OR DIVIDER
                    kDivider,

                    logInSignUpButton(
                      "Google",
                      Icons.arrow_forward_rounded,
                      context,
                      () => signUp(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Container(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                            text: "Already on Self-Worker? ",
                            style: TextStyle(fontSize: 18),
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = widget.onClickedSignIn,
                                text: "Sign in",
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
