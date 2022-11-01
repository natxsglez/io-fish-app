import 'dart:async';

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
  }

  FutureOr<void> _configureAmplify(event, emit) async {
    final provider = ModelProvider();
    final dataStorePlugin = AmplifyDataStore(modelProvider: provider);

    Amplify.addPlugin(dataStorePlugin);
    Amplify.configure(amplifyconfig);

    print("Amplify configured c:");
  }
}
