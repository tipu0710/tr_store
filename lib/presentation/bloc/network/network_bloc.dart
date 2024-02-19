import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tr_store/presentation/bloc/network/network_event.dart';
import 'package:tr_store/presentation/bloc/network/network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  final Stream<InternetConnectionStatus> connectionStream;
  NetworkBloc(this.connectionStream) : super(NetworkConnected()) {
    on<StartNetwork>((event, emit) async {
      await connectionStream.forEach((event) {
        if (event == InternetConnectionStatus.connected) {
          emit(NetworkConnected());
        } else {
          emit(NetworkDisconnected());
        }
      });
    });
  }
}
