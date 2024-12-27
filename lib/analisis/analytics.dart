import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalyticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Analytics')),
      body: Column(
        children: [
          Expanded(
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    value: 40,
                    title: '40%',
                    color: Colors.green,
                  ),
                  PieChartSectionData(
                    value: 30,
                    title: '30%',
                    color: Colors.blue,
                  ),
                  PieChartSectionData(
                    value: 20,
                    title: '20%',
                    color: Colors.orange,
                  ),
                  PieChartSectionData(
                    value: 10,
                    title: '10%',
                    color: Colors.red,
                  ),
                ],
                centerSpaceRadius: 40,
                sectionsSpace: 4,
                borderData: FlBorderData(show: false),
              ),
            ),
          ),
          Text(
            'Detail Pengeluaran',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
