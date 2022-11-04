import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:io_fish/services/tank/tank_bloc.dart';

class AddTankPage extends StatefulWidget {
  AddTankPage({super.key});

  @override
  State<AddTankPage> createState() => _AddTankPageState();
}

class _AddTankPageState extends State<AddTankPage> {
  final TextEditingController _fishTankController = TextEditingController();
  String? _dropdownvalue;
  final typeOfFish = [
    "Dorado",
    "Guppy",
    "Payaso",
  ];

  // TYPE OF SENSORS
  bool _isPhSelected = false;
  bool _isPhotoresistorSelected = false;
  bool _isTemperatureSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Agregar nueva pecera'),
          actions: [
            BlocListener<TankBloc, TankState>(
              listener: (context, state) {
                if (state is TankAddedSuccessState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Pecera agregada de manera exitosa")),
                  );
                  Navigator.of(context).pop();
                } else if (state is TankErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                            "No se pudo agregar la pecera, intenta de nuevo")),
                  );
                }
              },
              child: IconButton(
                  onPressed: () {
                    BlocProvider.of<TankBloc>(context).add(CreateTankEvent(
                        tankName: _fishTankController.value.text,
                        fishType: _dropdownvalue ?? "",
                        sensors: _createListOfSensors()));
                  },
                  icon: const Icon(Icons.save)),
            )
          ],
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
                value: _dropdownvalue,
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
                    _dropdownvalue = newValue!;
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
                  const Text("Fotoresistor"),
                  Switch(
                      activeColor: Theme.of(context).colorScheme.tertiary,
                      value: _isPhotoresistorSelected,
                      onChanged: (value) {
                        setState(() {
                          _isPhotoresistorSelected = value;
                        });
                      })
                ],
              ),
            )
          ],
        ));
  }

  List<String> _createListOfSensors() {
    List<String> sensors = [];
    if (_isPhSelected) {
      sensors.add("pH");
    }
    if (_isPhotoresistorSelected) {
      sensors.add("Fotoresistor");
    }
    if (_isTemperatureSelected) {
      sensors.add("Temperatura");
    }
    return sensors;
  }
}
