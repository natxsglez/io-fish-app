part of 'sensor_bloc.dart';

@immutable
abstract class SensorEvent {}

class GetSensorListEvent extends SensorEvent {
  final String tankId;

  GetSensorListEvent({required this.tankId});

  @override
  List<dynamic> get props => [tankId];
}

class CreateSensorEvent extends SensorEvent {
  final String tankId;
  final String sensorType;

  CreateSensorEvent({required this.tankId, required this.sensorType});

  @override
  List<dynamic> get props => [tankId, sensorType];
}

class GetSensorByIdEvent extends SensorEvent {
  final String sensorId;

  GetSensorByIdEvent({required this.sensorId});

  @override
  List<dynamic> get props => [sensorId];
}

class TankErrorEvent extends SensorEvent {}
