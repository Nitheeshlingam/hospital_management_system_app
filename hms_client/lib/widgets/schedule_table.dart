import 'package:flutter/material.dart';

class ScheduleTable extends StatelessWidget {
  final List<Map<String, String>> schedule = [
    {'day': 'MONDAY', 'time': '8.00 - 16.00'},
    {'day': 'TUESDAY', 'time': '8.00 - 16.00'},
    {'day': 'WEDNESDAY', 'time': '8.00 - 16.00'},
    {'day': 'THURSDAY', 'time': '8.00 - 16.00'},
    {'day': 'FRIDAY', 'time': '8.00 - 16.00'},
    {'day': 'SATURDAY', 'time': '8.00 - 16.00'},
    {'day': 'SUNDAY', 'time': '8.00 - 16.00'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF2ECC71),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Table(
            columnWidths: const {
              0: FlexColumnWidth(2),
              1: FlexColumnWidth(1),
            },
            children: schedule
                .map(
                  (item) => TableRow(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.white24, width: 1),
                      ),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          item['day']!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          item['time']!,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
          SizedBox(height: 16),
          Icon(
            Icons.access_time_filled,
            color: Colors.white30,
            size: 60,
          ),
        ],
      ),
    );
  }
}
