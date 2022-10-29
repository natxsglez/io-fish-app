import 'package:flutter/material.dart';

class AddTankPage extends StatefulWidget {
  AddTankPage({super.key});

  @override
  State<AddTankPage> createState() => _AddTankPageState();
}

class _AddTankPageState extends State<AddTankPage> {
  final TextEditingController _fishTankController = TextEditingController();
  String? dropdownvalue;
  final typeOfFish = [
    "Dorado",
    "Guppy",
    "Payaso",
  ];

  // TYPE OF SENSORS
  bool _isPhSelected = false;
  bool _isSolidDetectionSelected = false;
  bool _isTemperatureSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Agregar nueva pecera'),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.save))],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                  controller: _fishTankController,
                  decoration: const InputDecoration(
                      label: Text("Nombre de la pecera"))),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: DropdownButton(
                isExpanded: true,
                value: dropdownvalue,
                hint: const Text("Tipo de pez"),
                icon: const Icon(Icons.keyboard_arrow_down),
                items: typeOfFish.map((String items) {
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
            Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Selecciona los sensores que tiene tu pecera",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("pH"),
                  Switch(
                      activeColor: Theme.of(context).colorScheme.tertiary,
                      value: _isPhSelected,
                      onChanged: (value) {
                        setState(() {
                          _isPhSelected = value;
                        });
                      })
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Temperatura"),
                  Switch(
                      activeColor: Theme.of(context).colorScheme.tertiary,
                      value: _isTemperatureSelected,
                      onChanged: (value) {
                        setState(() {
                          _isTemperatureSelected = value;
                        });
                      }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Detección de sólidos"),
                  Switch(
                      activeColor: Theme.of(context).colorScheme.tertiary,
                      value: _isSolidDetectionSelected,
                      onChanged: (value) {
                        setState(() {
                          _isSolidDetectionSelected = value;
                        });
                      })
                ],
              ),
            )
          ],
        ));
  }
}
