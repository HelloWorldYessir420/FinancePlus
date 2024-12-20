import 'package:flutter/material.dart';
import 'transaksi/transaksi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Transaction App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: TransactionPage(), // Panggil halaman transaksi
    );
  }
}
