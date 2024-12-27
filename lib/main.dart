import 'package:flutter/material.dart';
import 'wallet/wallet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallet App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: WalletPage(), // Panggil halaman wallet
    );
  }
}
