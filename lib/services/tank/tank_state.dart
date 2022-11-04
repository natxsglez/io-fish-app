part of 'tank_bloc.dart';

@immutable
abstract class TankState {
  const TankState();

  @override
  List<dynamic> get props => [];
}

class TankInitialState extends TankState {}

class AddNewTankState extends TankState {}

class GetTankListState extends TankState {}

class GetTankByIdState extends TankState {}

class TankAddedSuccessState extends TankState {}

class NoTankFoundState extends TankState {}

class NoTankListFoundState extends TankState {}

class TankErrorState extends TankState {
  final error;

  const TankErrorState({required this.error});

  @override
  List<dynamic> get props => [error];
}

class GetTankListSuccessState extends TankState {
  final List<dynamic> tankList;

  const GetTankListSuccessState({required this.tankList});

  @override
  List<dynamic> get props => [tankList];
}

class GetTankSuccessState extends TankState {
  final dynamic tank;

  const GetTankSuccessState({required this.tank});

  @override
  List<dynamic> get props => [tank];
}
