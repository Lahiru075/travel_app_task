import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.map_rounded,
                      size: 40,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Center(
                  child: Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Center(
                  child: Text(
                    "Sign in to continue your adventure",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 50),

                _buildLabel("Email Address"),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: _inputStyle(
                    "Enter your email",
                    Icons.alternate_email_rounded,
                  ),
                ),

                const SizedBox(height: 25),

                _buildLabel("Password"),
                const SizedBox(height: 10),
                TextFormField(
                  obscureText: !_isPasswordVisible,
                  decoration: _inputStyle(
                    "Enter your password",
                    Icons.lock_outline_rounded,
                    isPassword: true,
                  ),
                ),

                const SizedBox(height: 35),

                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      // Navigate only if valid
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                _buildDivider(),
                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey[200]!),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.g_mobiledata_rounded,
                          size: 35,
                          color: Colors.red,
                        ), 
                        const SizedBox(width: 8),
                        const Text(
                          "Continue with Google",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 40),
                _buildFooter(context),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String label) => Text(
    label,
    style: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Color(0xFF404040),
    ),
  );

  Widget _buildDivider() => Row(
    children: [
      Expanded(child: Divider(color: Colors.grey[200])),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text("OR", style: TextStyle(color: Colors.grey, fontSize: 12)),
      ),
      Expanded(child: Divider(color: Colors.grey[200])),
    ],
  );

  Widget _buildFooter(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("New here? ", style: TextStyle(color: Colors.grey)),
      GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignupScreen()),
        ),
        child: const Text(
          "Create an account",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );

  InputDecoration _inputStyle(
    String hint,
    IconData icon, {
    bool isPassword = false,
  }) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon, color: Colors.blue[300], size: 20),
      suffixIcon: isPassword
          ? IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () =>
                  setState(() => _isPasswordVisible = !_isPasswordVisible),
            )
          : null,
      filled: true,
      fillColor: const Color(0xFFF9F9F9),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.grey[100]!),
      ),
    );
  }
}
