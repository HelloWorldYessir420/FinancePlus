import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  List<Map<String, dynamic>> expenses = [
    {'name': 'Food', 'amount': 200},
    {'name': 'Education', 'amount': 100},
    {'name': 'Baby', 'amount': 40},
    {'name': 'Tax', 'amount': 50},
    {'name': 'Recreation', 'amount': 70},
    {'name': 'Daily', 'amount': 100},
    {'name': 'Gift', 'amount': 50},
    {'name': 'Dress', 'amount': 30},
  ];

  void _addExpense(String name, double amount) {
    setState(() {
      expenses.add({'name': name, 'amount': amount});
    });
  }

  double get totalExpenses {
    return expenses.fold(0, (sum, item) => sum + item['amount']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Ringkasan Transaksi
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_left),
                          onPressed: () {}, // Fungsi untuk navigasi bulan sebelumnya
                        ),
                        Text(
                          'September 2024',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_right),
                          onPressed: () {}, // Fungsi untuk navigasi bulan berikutnya
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(
                              '-\$${totalExpenses.toStringAsFixed(2)}',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Income', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(
                              '\$0.00',
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Expenses', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(
                              '\$${totalExpenses.toStringAsFixed(2)}',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            // Detail Pengeluaran
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Detail',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Divider(),
                      Expanded(
                        child: ListView.builder(
                          itemCount: expenses.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(expenses[index]['name']),
                              trailing: Text(
                                '\$${expenses[index]['amount'].toStringAsFixed(2)}',
                                style: TextStyle(color: Colors.red),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: () => _showAddExpenseDialog(context),
      ),
    );
  }

  void _showAddExpenseDialog(BuildContext context) {
    String name = '';
    String amount = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Expense'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  name = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  amount = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Add'),
              onPressed: () {
                if (name.isNotEmpty && amount.isNotEmpty) {
                  _addExpense(name, double.tryParse(amount) ?? 0);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
