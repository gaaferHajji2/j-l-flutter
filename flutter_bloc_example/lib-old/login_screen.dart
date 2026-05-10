import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/auth_bloc.dart';
import 'widgets/gradient_button.dart';
import 'widgets/login_field.dart';
import 'widgets/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // We can also use: BlocConsumer which is: BlocListener + BlocBuilder
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: Colors.redAccent,
              ),
            );
          } else if (state is AuthSuccess) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Login Success"),
                backgroundColor: Colors.lightGreen,
              ),
            );
          } else if (state is AuthLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return Center(child: CircularProgressIndicator());
              },
            );
          } else {
            Navigator.of(context).pop();
          }
        },
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/images/signin_balls.png'),
                const Text(
                  'Sign in.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      const SocialButton(
                        iconPath: 'assets/svgs/g_logo.svg',
                        label: 'Continue with Google',
                        horizontalPadding: 10,
                      ),
                      const SizedBox(height: 20),
                      const SocialButton(
                        iconPath: 'assets/svgs/f_logo.svg',
                        label: 'Continue with Facebook',
                        horizontalPadding: 10,
                      ),
                      const SizedBox(height: 15),
                      const Text('or', style: TextStyle(fontSize: 17)),
                      const SizedBox(height: 15),
                      LoginField(
                        hintText: 'Email',
                        controller: emailController,
                      ),
                      const SizedBox(height: 15),
                      LoginField(
                        hintText: 'Password',
                        controller: passwordController,
                      ),
                      const SizedBox(height: 20),
                      GradientButton(
                        onPress: () {
                          context.read<AuthBloc>().add(
                            AuthLoginRequested(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
