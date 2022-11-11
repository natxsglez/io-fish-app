import 'package:flutter/material.dart';

class SensorGraphPage extends StatelessWidget {
  const SensorGraphPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          height: 50,
          child: const Text("Aquí va la gráfica de pH"),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(15.0),
          child: const Text(
            "Detección de sólidos disueltos",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 50,
          child: const Text(
              "Aquí va la gráfica de Detección de sólidos disueltos"),
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
          height: 50,
          child: const Text("Aquí va la gráfica de Temperatura"),
        )
      ],
    );
  }
}
