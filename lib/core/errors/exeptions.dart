import 'package:equatable/equatable.dart';

class APIExeption extends Equatable implements Exception {
  final String message;
  final int statusCode;

  const APIExeption({required this.message, required this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}

class CacheException extends Equatable implements Exception {
  final String message;
  final int statusCode;

  const CacheException({required this.message, required this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}
