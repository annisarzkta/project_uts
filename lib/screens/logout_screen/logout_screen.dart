import 'package:flutter/material.dart';
import 'auth.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({Key? key}) : super(key: key);
  static String routeName = 'LogoutScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logout'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Auth.logout; // Panggil fungsi logout dari utilitas autentikasi Anda
            Navigator.popUntil(
                context,
                ModalRoute.withName(
                    '/')); // Kembali ke halaman awal (misalnya HomeScreen)
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
