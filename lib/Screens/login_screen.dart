import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import 'home_screen.dart';
import '../core/Theme/app_colors.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primary,
              AppColors.secondary,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 60),
                Image.asset(
                  'assets/logo.png',
                  height: 250,
                ),
                const SizedBox(height: 120),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: emailController,
                    style: const TextStyle(color: AppColors.textLight),
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      hintText: "Email",
                      filled: false,
                      hintStyle: TextStyle(color: AppColors.textLight),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.textLight),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        style: const TextStyle(color: AppColors.textLight),
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          hintText: "Password",
                          filled: false,
                          hintStyle: TextStyle(color: AppColors.textLight),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.textLight),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Forgot your password?",
                        style: TextStyle(
                          color: AppColors.textLight,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: auth.isLoading
                        ? null
                        : () async {
                      final email = emailController.text.trim();
                      final password = passwordController.text.trim();

                      if (email.isEmpty || password.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Both fields required"),
                          ),
                        );
                        return;
                      }

                      final success = await ref
                          .read(authProvider.notifier)
                          .login(email, password);

                      if (success) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                            Text(auth.error ?? "Login failed"),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: auth.isLoading
                        ? const CircularProgressIndicator(
                      color: AppColors.secondary,
                    )
                        : const Text(
                      "Login",
                      style: TextStyle(
                        color: AppColors.secondary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
