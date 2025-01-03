import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalyticsPage extends StatelessWidget {
  final Map<String, double> expenses = {
    "Food": 200,
    "Education": 100,
    "Baby": 40,
    "Tax": 50,
    "Recreation": 70,
    "Daily": 100,
    "Gift": 50,
    "Dress": 30,
  };

  @override
  Widget build(BuildContext context) {
    double totalExpenses = expenses.values.fold(0, (sum, value) => sum + value);

    return Scaffold(
      appBar: AppBar(
        title: Text('Analytics'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Pie Chart
            Expanded(
              flex: 3,
              child: PieChart(
                PieChartData(
                  sections: expenses.entries.map((entry) {
                    final percentage = (entry.value / totalExpenses) * 100;
                    return PieChartSectionData(
                      color: _getColor(entry.key),
                      value: entry.value,
                      title: "${percentage.toStringAsFixed(1)}%",
                      radius: 60,
                      titleStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    );
                  }).toList(),
                  sectionsSpace: 2,
                  centerSpaceRadius: 40,
                  borderData: FlBorderData(show: false),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Month Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_left, size: 30),
                  onPressed: () {
                    // Logic for previous month
                  },
                ),
                Text(
                  "September 2024",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_right, size: 30),
                  onPressed: () {
                    // Logic for next month
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            // Expense Detail
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Detail",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Divider(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: expenses.length,
                      itemBuilder: (context, index) {
                        final entry = expenses.entries.toList()[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                entry.key,
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "\$${entry.value.toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to assign colors
  Color _getColor(String category) {
    final Map<String, Color> categoryColors = {
      "Food": Colors.green,
      "Education": Colors.blue,
      "Baby": Colors.orange,
      "Tax": Colors.red,
      "Recreation": Colors.purple,
      "Daily": Colors.cyan,
      "Gift": Colors.pink,
      "Dress": Colors.yellow,
    };
    return categoryColors[category] ?? Colors.grey;
  }
}
