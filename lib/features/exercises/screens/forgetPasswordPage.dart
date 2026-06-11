import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lift_app/core/theme/app_theme.dart';

class Forgetpasswordpage extends StatefulWidget {
  const Forgetpasswordpage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Forgetpasswordpage();
  }
}

class _Forgetpasswordpage extends State<Forgetpasswordpage> {
  final _emailController = TextEditingController();

  Future<void> passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          content: Text('Password Reset Email Successfully sent!'),
        ),
      );
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(content: Text(e.message.toString())),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forget Password')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter your email address below',
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,

                keyboardType: TextInputType.emailAddress,

                decoration: InputDecoration(
                  hintText: 'Email',

                  contentPadding: const EdgeInsets.all(18),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  await passwordReset();
                },

                child: Container(
                  width: 300,

                  padding: const EdgeInsets.symmetric(vertical: 18),

                  decoration: BoxDecoration(
                    color: AppColors.primary,

                    borderRadius: BorderRadius.circular(14),
                  ),

                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        'RESET PASSWORD',

                        style: TextStyle(
                          color: AppColors.background,

                          fontSize: 16,

                          fontWeight: FontWeight.w800,

                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
