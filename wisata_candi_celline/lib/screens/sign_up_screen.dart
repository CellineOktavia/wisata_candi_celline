import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';
  bool _obscurePassword = true;

  // TODO: 1. Membuat fungsi _signUp
  void _signUp() {
    String name = _nameController.text.trim();
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (password.length < 8 ||
        !password.contains(RegExp(r'[A-Z]')) ||
        !password.contains(RegExp(r'[a-z]')) ||
        !password.contains(RegExp(r'[0-9]')) ||
        !password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      setState(() {
        _errorText = 'Minimal 8 karakter, kombinasi [A-Z], [a-z], [0-9], [!@#\$%^&*(),.?":{}|<>]';
      });
      return;
    }

    setState(() {
      _errorText = '';
    });

    print('*** Sign Up Berhasil! ***');
    print('Nama: $name');
    print('Nama Pengguna: $username');
    print('Password: $password');

    // Navigasi ke layar lain setelah pendaftaran berhasil
    Navigator.pop(context);
  }

  // TODO: 2. Membuat fungsi dispose
  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Metode build HARUS berada di dalam class _SignUpScreenState
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // TODO 3. TextFormField Nama Lengkap
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nama',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // TODO 4. TextFormField Nama Pengguna
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Nama Pengguna',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // TODO 5. TextFormField Kata Sandi
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Kata Sandi',
                      errorText: _errorText.isNotEmpty ? _errorText : null,
                      errorMaxLines: 2, // Agar teks error tidak terpotong
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // TODO 7. Tombol Daftar
                  ElevatedButton(
                    onPressed: _signUp,
                    child: const Text('Daftar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
} // <-- Kurung tutup class _SignUpScreenState dipindahkan ke paling bawah
