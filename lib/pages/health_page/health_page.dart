import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HealthPage extends StatelessWidget {
  const HealthPage({super.key});

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
              subtitle: Text("Actualizado el 11-08-2021 15:17"),
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
                  "Hoy",
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
            child: const Text("Aquí va la gráfica"),
          ),
        )
      ],
    );
  }
}
