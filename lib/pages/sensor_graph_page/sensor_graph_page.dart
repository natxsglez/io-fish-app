import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class SensorData {
  final double day;
  final double data;

  SensorData({required this.day, required this.data});
}

class SensorGraphPage extends StatelessWidget {
  SensorGraphPage({super.key});
  final toolTip = TooltipBehavior(enable: true);
  List<SensorData> photoresistorData = [
    SensorData(day: 1, data: 61),
    SensorData(day: 2, data: 59),
    SensorData(day: 3, data: 62),
    SensorData(day: 4, data: 51),
    SensorData(day: 5, data: 52),
    SensorData(day: 6, data: 50),
    SensorData(day: 7, data: 53),
    SensorData(day: 8, data: 61),
    SensorData(day: 9, data: 52),
    SensorData(day: 10, data: 59),
    SensorData(day: 11, data: 49),
    SensorData(day: 12, data: 47),
    SensorData(day: 13, data: 51),
    SensorData(day: 14, data: 60),
    SensorData(day: 15, data: 52),
  ];

  List<SensorData> phIdxData = [
    SensorData(day: 1, data: 100),
    SensorData(day: 2, data: 99),
    SensorData(day: 3, data: 100),
    SensorData(day: 4, data: 51),
    SensorData(day: 5, data: 99),
    SensorData(day: 6, data: 99),
    SensorData(day: 7, data: 99),
    SensorData(day: 8, data: 99),
    SensorData(day: 9, data: 100),
    SensorData(day: 10, data: 99),
    SensorData(day: 11, data: 99),
    SensorData(day: 12, data: 99),
    SensorData(day: 13, data: 99),
    SensorData(day: 14, data: 99),
    SensorData(day: 15, data: 99),
  ];

  List<SensorData> temperatureData = [
    SensorData(day: 1, data: 28.93),
    SensorData(day: 2, data: 18.68),
    SensorData(day: 3, data: 30.5),
    SensorData(day: 4, data: 17.95),
    SensorData(day: 5, data: 18.19),
    SensorData(day: 6, data: 18.68),
    SensorData(day: 7, data: 18.31),
    SensorData(day: 8, data: 28.31),
    SensorData(day: 9, data: 17.95),
    SensorData(day: 10, data: 18.31),
    SensorData(day: 11, data: 13.79),
    SensorData(day: 12, data: 17.58),
    SensorData(day: 13, data: 18.31),
    SensorData(day: 14, data: 18.92),
    SensorData(day: 15, data: 18.31),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Gráficas de sensores",
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(15.0),
            child: const Text(
              "pH",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 300,
            child: SfCartesianChart(
              legend: Legend(isResponsive: true),
              tooltipBehavior: toolTip,
              primaryXAxis: CategoryAxis(
                  title: AxisTitle(
                text: 'Día',
              )),
              primaryYAxis: CategoryAxis(
                  title: AxisTitle(
                text: 'pH',
              )),
              series: <ChartSeries>[
                LineSeries<SensorData, double>(
                  dataSource: phIdxData,
                  xValueMapper: (SensorData ph, _) => ph.day,
                  yValueMapper: (SensorData ph, _) => ph.data,
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(15.0),
            child: const Text(
              "Fotoresistor",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 300,
            child: SfCartesianChart(
              legend: Legend(isResponsive: true),
              tooltipBehavior: toolTip,
              primaryXAxis: CategoryAxis(
                  title: AxisTitle(
                text: 'Día',
              )),
              primaryYAxis: CategoryAxis(
                  title: AxisTitle(
                text: 'Fotones',
              )),
              series: <ChartSeries>[
                LineSeries<SensorData, double>(
                  dataSource: photoresistorData,
                  xValueMapper: (SensorData photoresistor, _) =>
                      photoresistor.day,
                  yValueMapper: (SensorData photoresistor, _) =>
                      photoresistor.data,
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(15.0),
            child: const Text(
              "Temperatura",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 300,
            child: SfCartesianChart(
              legend: Legend(isResponsive: true),
              tooltipBehavior: toolTip,
              primaryXAxis: CategoryAxis(
                  title: AxisTitle(
                text: 'Día',
              )),
              primaryYAxis: CategoryAxis(
                  title: AxisTitle(
                text: 'ºC',
              )),
              series: <ChartSeries>[
                LineSeries<SensorData, double>(
                  dataSource: temperatureData,
                  xValueMapper: (SensorData temp, _) => temp.day,
                  yValueMapper: (SensorData temp, _) => temp.data,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
