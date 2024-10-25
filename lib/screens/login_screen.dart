import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  
  void _autoFillLogin() {
    _emailController.text = "octavio02@gmail.com"; 
    _passwordController.text = "Ellen22";
  }

  @override
  void dispose() {
    
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 254, 254),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),
              
              const Icon(
                Icons.visibility,
                size: 100,
                color: Color(0xFF4E7D96),
              ),
              const SizedBox(height: 20),
              
              const Text(
                'Halo, Selamat Datang!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4E7D96),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Masuk untuk melanjutkan',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 84, 78, 78),
                ),
              ),
              const SizedBox(height: 40),
              
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email_outlined, color: Color.fromARGB(255, 72, 119, 145)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 231, 235, 240),
                  
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () => _emailController.clear(),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Kata Sandi',
                  prefixIcon: const Icon(Icons.lock_outline, color: Color.fromARGB(255, 60, 115, 145)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 228, 236, 240),
                  
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () => _passwordController.clear(),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              
              TextButton(
                onPressed: _autoFillLogin,
                child: const Text(
                  'Masuk untuk mengisi otomatis',
                  style: TextStyle(
                    color: Color.fromARGB(255, 56, 114, 146),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              
              ElevatedButton(
                onPressed: () {
                  
                  if (_emailController.text.isNotEmpty && 
                      _passwordController.text.isNotEmpty) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/Beranda Saya',
                      (route) => false,
                    );
                  } else {
                    
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Silahkan mengisi semua kolom'),
                        backgroundColor: Color.fromARGB(255, 229, 151, 68),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Masuk',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              const SizedBox(height: 15),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum memiliki akun? ',
                    style: TextStyle(color: const Color.fromARGB(255, 70, 66, 66)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Daftar');
                    },
                    child: const Text(
                      'Daftar',
                      style: TextStyle(
                        color: Color.fromARGB(255, 55, 113, 144),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}