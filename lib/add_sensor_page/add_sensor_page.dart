import 'package:flutter/material.dart';

class AddSensorPage extends StatefulWidget {
  const AddSensorPage({super.key});

  @override
  State<AddSensorPage> createState() => _AddSensorPageState();
}

class _AddSensorPageState extends State<AddSensorPage> {
  String? dropdownvalue = null;
  final typeOfSensor = ["pH", "Detección de sólidos", "Temperatura"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Agregar sensor")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 50.0, 12.0, 50.0),
            child: DropdownButton(
              isExpanded: true,
              value: dropdownvalue,
              hint: const Text("Tipo de sensor"),
              icon: const Icon(Icons.keyboard_arrow_down),
              items: typeOfSensor.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 8.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Theme.of(context).colorScheme.secondary),
              child: const Text(
                "AGREGAR SENSOR",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
