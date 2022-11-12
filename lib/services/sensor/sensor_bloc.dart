import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:io_fish/repositories/sensor_repository.dart';

part 'sensor_event.dart';
part 'sensor_state.dart';

class SensorBloc extends Bloc<SensorEvent, SensorState> {
  final SensorRepository _sensorRepository = SensorRepository();

  SensorBloc() : super(SensorInitialState()) {
    on<CreateSensorEvent>(_createNewSensor);
    on<GetSensorListEvent>(_getSensorList);
    on<GetSensorByIdEvent>(_getSensorById);
  }

  FutureOr<void> _createNewSensor(event, emit) async {
    try {
      await _sensorRepository.createNewSensor(event.tankId, event.sensorType);
      emit(SensorAddedSuccessState());
    } catch (error) {
      emit(SensorErrorState(error: error));
    }
  }

  FutureOr<void> _getSensorList(event, emit) async {
    try {
      final sensorList = await _sensorRepository.getSensorsList(event.tankId);
      if (sensorList.isNotEmpty) {
        emit(GetSensorListSuccessState(sensorList: sensorList));
      } else {
        emit(NoSensorListFoundState());
      }
    } catch (error) {
      emit(SensorErrorState(error: error));
    }
  }

  FutureOr<void> _getSensorById(event, emit) async {
    try {
      final sensor = await _sensorRepository.getSensorById(event.sensorId);
      if (sensor.isEmpty) {
        emit(NoSensorFoundState());
      } else {
        emit(GetSensorSuccessState(sensor: sensor));
      }
    } catch (error) {
      emit(SensorErrorState(error: error));
    }
  }
}
