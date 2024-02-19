import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trace_app_3d/screens/home.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = true;
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  void toggleShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  void login() async {
    //validate the form
    if (formKey.currentState!.validate()) {
      //proceed to login
      EasyLoading.show(status: 'Processing...');
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((user) {
        EasyLoading.dismiss();
        Navigator.of(context).push(
          CupertinoPageRoute(builder: (_) => HomeScreen()),
        );
      }).catchError((error) {
        print('ERROR $error');
        EasyLoading.showError('Incorrect Username and/or Password');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login_back.webp'),
            opacity: 0.4,
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Gap(22),
              const Text('Sign in your account'),
              const Gap(16),
              TextFormField(
                controller: email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required. Please enter an email address';
                  }
                  if (!EmailValidator.validate(value)) {
                    return 'Please enter a valid email address.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text('Email Address'),
                  border: OutlineInputBorder(),
                ),
              ),
              const Gap(12),
              TextFormField(
                controller: password,
                obscureText: showPassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required. Please enter your password';
                  }
                  if (value.length <= 5) {
                    return 'Password shoud be more than 6 characters';
                  }
                  return null;
                },
                // maxLength: 8,
                decoration: InputDecoration(
                  label: Text('Password'),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: toggleShowPassword,
                    icon: Icon(
                        showPassword ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
              ),
              const Gap(12),
              ElevatedButton(
                onPressed: login,
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
