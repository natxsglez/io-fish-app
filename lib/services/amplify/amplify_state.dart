part of 'amplify_bloc.dart';

abstract class AmplifyState extends Equatable {
  const AmplifyState();

  @override
  List<Object> get props => [];
}

class AmplifyInitialState extends AmplifyState {}

class AmplifyConfigureState extends AmplifyState {}

class AmplifySettingSuccessState extends AmplifyState {}

class AmplifyUserSignedOutState extends AmplifyState {}
