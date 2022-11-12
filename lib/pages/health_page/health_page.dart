import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SensorData {
  final double day;
  final double data;

  SensorData({required this.day, required this.data});
}

class HealthPage extends StatelessWidget {
  HealthPage({super.key});
  final toolTip = TooltipBehavior(enable: true);
  List<SensorData> healthData = [
    SensorData(day: 1, data: 61),
    SensorData(day: 2, data: 59),
    SensorData(day: 3, data: 62),
    SensorData(day: 4, data: 51),
    SensorData(day: 5, data: 52),
    SensorData(day: 6, data: 50),
    SensorData(day: 7, data: 33),
    SensorData(day: 8, data: 48),
    SensorData(day: 9, data: 52),
    SensorData(day: 10, data: 59),
    SensorData(day: 11, data: 88),
    SensorData(day: 12, data: 87),
    SensorData(day: 13, data: 51),
    SensorData(day: 14, data: 60),
    SensorData(day: 15, data: 52),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15.0),
          alignment: Alignment.centerLeft,
          child: const Text(
            "Estado de salud",
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        const Card(
          child: ListTile(
              title: Text("Puntaje más reciente"),
              subtitle: Text("Actualizado el 11-08-2022 15:17"),
              leading: CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 30.0,
                  child: Text(
                    "58",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ))),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Este mes",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: const Text(
                  "Puntaje promedio: 70",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: SfCartesianChart(
              legend: Legend(isResponsive: true),
              tooltipBehavior: toolTip,
              primaryXAxis: CategoryAxis(
                  title: AxisTitle(
                text: 'Día',
              )),
              primaryYAxis: CategoryAxis(
                  title: AxisTitle(
                text: 'Puntaje',
              )),
              series: <ChartSeries>[
                LineSeries<SensorData, double>(
                  dataSource: healthData,
                  xValueMapper: (SensorData health, _) => health.day,
                  yValueMapper: (SensorData health, _) => health.data,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
