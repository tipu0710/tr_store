import 'package:equatable/equatable.dart';

abstract class NetworkEvent extends Equatable {
  const NetworkEvent();

  @override
  List<Object?> get props => [];
}

class StartNetwork extends NetworkEvent {
  const StartNetwork();

  @override
  List<Object?> get props => [];
}
