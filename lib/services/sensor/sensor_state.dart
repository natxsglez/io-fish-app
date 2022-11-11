part of 'sensor_bloc.dart';

@immutable
abstract class SensorState {
  const SensorState();

  @override
  List<dynamic> get props => [];
}

class SensorInitialState extends SensorState {}

class AddNewSensorState extends SensorState {}

class GetSensorListState extends SensorState {}

class GetSensorByIdState extends SensorState {}

class SensorAddedSuccessState extends SensorState {}

class NoSensorFoundState extends SensorState {}

class NoSensorListFoundState extends SensorState {}

class SensorErrorState extends SensorState {
  final error;

  const SensorErrorState({required this.error});

  @override
  List<dynamic> get props => [error];
}

class GetSensorListSuccessState extends SensorState {
  final List<dynamic> sensorList;

  const GetSensorListSuccessState({required this.sensorList});

  @override
  List<dynamic> get props => [sensorList];
}

class GetSensorSuccessState extends SensorState {
  final dynamic sensor;

  const GetSensorSuccessState({required this.sensor});

  @override
  List<dynamic> get props => [sensor];
}
