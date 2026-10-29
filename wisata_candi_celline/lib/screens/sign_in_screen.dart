import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // 1. Deklarasi Variabel
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';
  bool _obscurePassword = true;

  late final TapGestureRecognizer _signUpRecognizer = TapGestureRecognizer()
    ..onTap = () {
      // Handle sign up action
    };

  // Bersihkan controller & recognizer untuk mencegah memory leak
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _signUpRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO 2: Pasang AppBar
      appBar: AppBar(title: const Text('Sign In')),
      //TODO 3: Pasang body
      body: Center(
        child: SingleChildScrollView(
          //TODO 4: Atur alignment
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // TODO 5: TextFormField Nama Pengguna
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Nama Pengguna',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // TODO 6: TextFormField Kata Sandi
                  TextFormField(
                    controller: _passwordController,
                    obscureText:
                        _obscurePassword, // Mengatur sensor/teks password
                    decoration: InputDecoration(
                      labelText: 'Kata Sandi',
                      errorText: _errorText.isNotEmpty ? _errorText : null,
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          // Memperbarui UI saat ikon mata ditekan
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // TODO 7: ElevatedButton Sign In
                  ElevatedButton(
                    onPressed: () {
                      // Logika Sign In
                    },
                    child: const Text('Sign In'),
                  ),

                  const SizedBox(height: 16),

                  //TODO 8: TextButton Sign Up (alternatif: RichText Sign Up)
                  RichText(
                    text: TextSpan(
                      text: 'Belum punya akun? ',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.deepPurple,
                      ),
                      children: [
                        TextSpan(
                          text: 'Daftar di sini.',
                          style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: _signUpRecognizer, // Ini sudah TapGestureRecognizer().onTap = (){}, => ini ada deklarasi variabel di atas
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
    );
  }
}
