import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:cat_tinder/loggedin.dart';
import 'package:cat_tinder/register.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _shakeAnimation =
        Tween<double>(begin: 0, end: 10).animate(_animationController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _animationController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _animationController.forward();
            }
          });
    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _shakeAnimation,
                child: Image.asset(
                  'assets/images/cat.png',
                  width: 100, // Adjust the size to make the logo smaller
                ),
                builder: (context, child) {
                  final double sinValue =
                      math.sin(_animationController.value * math.pi * 10);
                  return Transform.translate(
                    offset: Offset(
                      _shakeAnimation.value * sinValue, // Diagonal X-axis shake
                      _shakeAnimation.value * sinValue, // Diagonal Y-axis shake
                    ),
                    child: child,
                  );
                },
              ),
              const Text(
                'purrfect pairing',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: '', // Removed text
                  border: InputBorder.none, // Removes border
                  prefixIcon: const Icon(Icons.email),
                  enabledBorder: UnderlineInputBorder(
                    // Adds underline
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    // Keeps underline while typing
                    borderSide: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .primary), // Or any color you prefer
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: '', // Removed text
                  border: InputBorder.none, // Removes border
                  prefixIcon: const Icon(Icons.lock),
                  enabledBorder: UnderlineInputBorder(
                    // Adds underline
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    // Keeps underline while typing
                    borderSide: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .primary), // Or any color you prefer
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Add your sign-in validation logic here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoggedInScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'sign in ~',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add your sign-in validation logic here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'register with us!',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
