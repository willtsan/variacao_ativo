import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../controller/home.controller.dart';

class ChartComponent extends StatefulWidget {
  final HomeController controller;

  const ChartComponent({Key? key, required this.controller}) : super(key: key);

  @override
  ChartComponentState createState() => ChartComponentState();
}

class ChartComponentState extends State<ChartComponent> {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (touchedSpots) => touchedSpots
              .map((spot) => LineTooltipItem(
                  '${DateFormat('HH:mm').format(
                    (DateTime.parse(
                      widget.controller.items[spot.x.toInt()].date.toString(),
                    )),
                  )}\nR${NumberFormat.simpleCurrency().format(spot.y)}',
                  const TextStyle(color: Colors.white)))
              .toList(),
        )),
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 5,
              getTitlesWidget: (value, meta) => Text(
                DateFormat('HH:mm').format(
                  (DateTime.parse(
                    widget.controller.items[value.toInt()].date.toString(),
                  )),
                ),
              ),
            ),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) => Text(value.toStringAsFixed(1),
                  style: const TextStyle(fontSize: 10)),
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.black38, width: 3),
        ),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            color: Colors.blue,
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(show: true),
            belowBarData: BarAreaData(show: false),
            spots: List.generate(
              widget.controller.items.length,
              ((index) => FlSpot(
                    index.toDouble(),
                    double.parse(
                      widget.controller.items[index].value.toStringAsFixed(2),
                    ),
                  )),
            ),
          ),
        ],
      ),
      swapAnimationDuration: const Duration(milliseconds: 150), // Optional
      swapAnimationCurve: Curves.linear, // Optional
    );
  }
}
