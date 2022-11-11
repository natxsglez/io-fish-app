import 'package:flutter/material.dart';
import 'package:io_fish/home_page/tank_item.dart';

class TankList extends StatelessWidget {
  final List<dynamic> tankList;
  TankList({super.key, required this.tankList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: tankList.length,
          itemBuilder: (BuildContext context, int index) {
            return TankItem(
              tank: tankList[index],
            );
          }),
    );
  }
}
