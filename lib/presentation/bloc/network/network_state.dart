import 'package:equatable/equatable.dart';

abstract class NetworkState extends Equatable {
  const NetworkState();

  @override
  List<Object?> get props => [];
}

class NetworkConnected extends NetworkState {}
class NetworkDisconnected extends NetworkState {}
