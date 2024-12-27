import 'package:flutter/material.dart';
import 'transaksi/transaksi.dart'; // Import halaman transaksi
import 'wallet/wallet.dart'; // Import halaman wallet

class HomePage extends StatelessWidget {
  final int currentIndex;

  HomePage({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      TransactionPage(),
      WalletPage(),
      PlaceholderPage(label: 'Stats'),
      PlaceholderPage(label: 'Profile'),
    ];

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(currentIndex: index),
            ),
          );
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

// Placeholder Page untuk Halaman Kosong
class PlaceholderPage extends StatelessWidget {
  final String label;

  PlaceholderPage({required this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$label Page not implemented yet',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
