// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:support/core/errors/exeptions.dart';

abstract class Failure extends Equatable {
  final String message;
  final int statusCode;

  const Failure({required this.message, required this.statusCode});
  @override
  List<Object> get props => [message, statusCode];
}

class APIFailure extends Failure {
  const APIFailure({
    required super.message,
    required super.statusCode,
  });

  APIFailure.fromExeption(APIExeption exeption)
      : this(message: exeption.message, statusCode: exeption.statusCode);
}

class CacheFailure extends Failure {
  const CacheFailure({
    required super.message,
    required super.statusCode,
  });

  CacheFailure.fromExeption(CacheException exeption)
      : this(message: exeption.message, statusCode: exeption.statusCode);
}
