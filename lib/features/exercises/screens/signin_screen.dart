import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lift_app/core/theme/app_theme.dart';
import 'package:lift_app/features/auth/bloc/auth_bloc.dart';
import 'package:lift_app/features/exercises/screens/forgetPasswordPage.dart';
import 'package:lift_app/features/exercises/screens/home_screen.dart';
import 'package:lift_app/features/exercises/screens/signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignInScreenState();
  }
}

class _SignInScreenState extends State<SignInScreen> {
  final formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false,
          );
        }
        if (state is AuthFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: const Center(child: CircularProgressIndicator()),
          );
        }
        return Scaffold(
          backgroundColor: AppColors.background,

          body: SafeArea(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),

                child: Padding(
                  padding: const EdgeInsets.all(15),

                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        const SizedBox(height: 65),

                        Text(
                          'Sign In',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 42,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2,
                          ),
                        ),

                        const SizedBox(height: 50),

                        Form(
                          key: formKey,

                          child: Column(
                            children: [
                              TextFormField(
                                controller: _emailController,

                                keyboardType: TextInputType.emailAddress,

                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      !value.contains('@')) {
                                    return 'Enter valid Email';
                                  }

                                  return null;
                                },

                                decoration: InputDecoration(
                                  hintText: 'Email',

                                  contentPadding: const EdgeInsets.all(18),

                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 15),

                              TextFormField(
                                controller: _passwordController,

                                obscureText: true,

                                keyboardType: TextInputType.visiblePassword,

                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }

                                  return null;
                                },

                                decoration: InputDecoration(
                                  hintText: 'Password',

                                  contentPadding: const EdgeInsets.all(18),

                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 15),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,

                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Forgetpasswordpage(),
                                        ),
                                      );
                                    },

                                    child: const Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromARGB(
                                          205,
                                          33,
                                          149,
                                          243,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 15),

                              GestureDetector(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<AuthBloc>().add(
                                      AuthLoginRequested(
                                        email: _emailController.text.trim(),
                                        password: _passwordController.text
                                            .trim(),
                                      ),
                                    );
                                  }
                                },

                                child: Container(
                                  width: double.infinity,

                                  padding: const EdgeInsets.symmetric(
                                    vertical: 18,
                                  ),

                                  decoration: BoxDecoration(
                                    color: AppColors.primary,

                                    borderRadius: BorderRadius.circular(14),
                                  ),

                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [
                                      Text(
                                        'SIGN IN',

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

                              const SizedBox(height: 10),

                              GestureDetector(
                                onTap: () {
                                  context.read<AuthBloc>().add(
                                    AuthGoogleSignInRequested(),
                                  );
                                },

                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 17,
                                  ),

                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(),
                                  ),

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/google.png',
                                        height: 30,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'CONTINUE WITH GOOGLE',
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

                              const SizedBox(height: 70),

                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen(),
                                    ),
                                  );
                                },

                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Don\'t have an account? ',

                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                            116,
                                            255,
                                            255,
                                            255,
                                          ),

                                          fontSize: 16,
                                        ),
                                      ),

                                      TextSpan(
                                        text: 'Sign Up',

                                        style: TextStyle(
                                          color: AppColors.primary,

                                          fontSize: 16,

                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
