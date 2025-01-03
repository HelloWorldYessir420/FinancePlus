import 'package:flutter/material.dart';

class WalletProvider extends ChangeNotifier {
  double _netAsset = 0.0; // Total Net Asset

  double get netAsset => _netAsset;

  void updateNetAsset(double value) {
    _netAsset = value;
    notifyListeners();
  }
}
