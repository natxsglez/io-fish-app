import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:io_fish/home_page/tank_item.dart';
import 'package:intl/intl.dart';

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
              tankName: tankList[index].tankName,
              addedOn: DateFormat("dd-MMM-yyyy")
                  .format(DateTime.parse(tankList[index].addedOn.toString())),
            );
          }),
    );
  }
}
