import 'package:freezed_annotation/freezed_annotation.dart';
part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.server(String message) = Server;
  const factory Failure.connection(String message) = Connection;
  const factory Failure.database(String message) = Database;
}
