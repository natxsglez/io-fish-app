part of 'tank_bloc.dart';

@immutable
abstract class TankEvent {}

class CreateTankEvent extends TankEvent {
  final String tankName;
  final List<String> sensors;
  final String fishType;

  CreateTankEvent(
      {required this.tankName, required this.fishType, required this.sensors});

  @override
  List<dynamic> get props => [tankName, fishType, sensors];
}

class GetTankListEvent extends TankEvent {}

class GetTankByIdEvent extends TankEvent {
  final String tankId;

  GetTankByIdEvent({required this.tankId});

  @override
  List<dynamic> get props => [tankId];
}

class TankErrorEvent extends TankEvent {}
