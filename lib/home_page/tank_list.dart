import 'package:flutter/material.dart';
import 'package:io_fish/home_page/tank_item.dart';

class TankList extends StatelessWidget {
  final List<dynamic> tankList = [
    {"tankName": "Pecera recibidor", "addedOn": "11-08-21"},
    {"tankName": "Pecera de cuarto 1", "addedOn": "11-08-21"}
  ];
  TankList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: tankList.length,
          itemBuilder: (BuildContext context, int index) {
            return TankItem(
              tankName: tankList[index]["tankName"],
              addedOn: tankList[index]["addedOn"],
            );
          }),
    );
  }
}
