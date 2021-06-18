import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final String displayName;

  const Authenticated({required this.displayName});

  @override
  List<Object> get props => [displayName];
}

class Unauthenticated extends AuthenticationState {}
