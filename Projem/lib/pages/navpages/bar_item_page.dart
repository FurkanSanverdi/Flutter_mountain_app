import 'package:flutter/material.dart';

class BarItemPage extends StatelessWidget {
  const BarItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bar Chart"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            height: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildBar("MON", 50, Colors.blue),
                _buildBar("TUE", 80, Colors.green),
                _buildBar("WED", 30, Colors.red),
                _buildBar("THU", 70, Colors.orange),
                _buildBar("FRI", 90, Colors.purple),
                _buildBar("SAT", 40, Colors.yellow),
                _buildBar("SUN", 60, Colors.teal),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBar(String label, double value, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40,
          height: value * 2, // Scale value for height
          color: color,
          alignment: Alignment.center,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(height: 8),
        Text(
          "${value.toInt()}",
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
