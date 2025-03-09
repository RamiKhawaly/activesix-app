import 'package:flutter/material.dart';
import '../services/auth_service.dart';

import '../forgot_password_screen.dart';
import 'main_screen.dart'; // Import the MainScreen

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  String _errorMessage = '';
  bool _isLoading = false;

  Future<void> _login(BuildContext context) async {
    setState(() {
      _errorMessage = '';
      _isLoading = true;
    });
    try {
      final user = await _authService.login(
        _usernameController.text,
        _passwordController.text,
      );
      if (user != null) {
        // Navigate to the MainScreen after successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
      // Show a red alert using a SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_errorMessage, style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Log in to your account',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _usernameController..text = 'emilys',
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Your E-Mail',
                    labelStyle: TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.black54,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _passwordController..text = 'emilyspass',
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.black54,
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Color(0xFFBAF247)),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                      activeColor: Color(0xFFBAF247),
                    ),
                    Expanded(
                      child: Text(
                        'I Accept The Terms & Conditions',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isLoading ? null : () => _login(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFBAF247),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text(
                    'LOG IN',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Or Login With',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: IconButton(
                    icon: Icon(Icons.g_mobiledata, color: Colors.white, size: 40),
                    onPressed: () {
                      // Handle Google login
                    },
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: TextButton(
                    onPressed: () {
                      // Navigate to sign up
                    },
                    child: Text(
                      "Don't Have An Account? Sign Up",
                      style: TextStyle(color: Color(0xFFBAF247)),
                    ),
                  ),
                ),
                if (_errorMessage.isNotEmpty)
                  Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
              ],
            ),
            if (_isLoading)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFBAF247)),
                  ),
                ),
              ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
