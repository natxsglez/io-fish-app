import 'dart:async';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:io_fish/amplifyconfiguration.dart';
import 'package:io_fish/models/ModelProvider.dart';

part 'amplify_event.dart';
part 'amplify_state.dart';

class AmplifyBloc extends Bloc<AmplifyEvent, AmplifyState> {
  AmplifyBloc() : super(AmplifyInitialState()) {
    on<ConfigureAmplifyEvent>(_configureAmplify);
    on<UserSingoutAmplifyEvent>(_userSignoutAmplify);
  }

  FutureOr<void> _configureAmplify(event, emit) async {
    final provider = ModelProvider();
    final dataStorePlugin = AmplifyDataStore(modelProvider: provider);

    await Amplify.addPlugin(AmplifyAuthCognito());
    await Amplify.addPlugin(AmplifyAPI());
    await Amplify.addPlugin(dataStorePlugin);

    await Amplify.configure(amplifyconfig);

    emit(AmplifySettingSuccessState());

    print("Amplify configured c:");
  }

  FutureOr<void> _userSignoutAmplify(event, emit) async {
    try {
      await Amplify.Auth.signOut();
      emit(AmplifyUserSignedOutState());
    } on AuthException catch (e) {
      print(e);
    }
  }
}
