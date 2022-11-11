import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:io_fish/repositories/sensor_repository.dart';
import 'package:io_fish/repositories/tank_repository.dart';

part 'tank_event.dart';
part 'tank_state.dart';

class TankBloc extends Bloc<TankEvent, TankState> {
  final TankRepository _tankRepository = TankRepository();
  final SensorRepository _sensorRepository = SensorRepository();

  TankBloc() : super(TankInitialState()) {
    on<CreateTankEvent>(_createNewTank);
    on<GetTankListEvent>(_getTankList);
    on<GetTankByIdEvent>(_getTankById);
  }

  FutureOr<void> _createNewTank(event, emit) async {
    try {
      final tankExists = await _tankRepository.getTankByName(event.tankName);
      if (tankExists.length > 0) {
        return;
      }
      await _tankRepository.createTank(
          event.tankName, event.fishType, event.sensors);
      final tankAdded = await _tankRepository.getTankByName(event.tankName);

      for (int i = 0; i < event.sensors.length; i++) {
        await _sensorRepository.createNewSensor(
            tankAdded[0].id, event.sensors[i]);
      }
      emit(TankAddedSuccessState());
    } catch (error) {
      emit(TankErrorState(error: error));
    }
  }

  FutureOr<void> _getTankList(event, emit) async {
    try {
      final tankList = await _tankRepository.getTanksList();
      if (tankList.isNotEmpty) {
        emit(GetTankListSuccessState(tankList: tankList));
      } else {
        emit(NoTankListFoundState());
      }
    } catch (error) {
      emit(TankErrorState(error: error));
    }
  }

  FutureOr<void> _getTankById(event, emit) async {
    try {
      final tank = await _tankRepository.getTankById(event.tankId);
      if (tank.isEmpty) {
        emit(NoTankFoundState());
      } else {
        emit(GetTankSuccessState(tank: tank));
      }
    } catch (error) {
      emit(TankErrorState(error: error));
    }
  }
}
