import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../model/User.dart';

enum AuthenticationStatus { unknow, authenticated, unauthenticated }

@immutable
class AppState extends Equatable {
  final AuthenticationStatus status;

  const AppState({required this.status});
  factory AppState.unknow() =>
      const AppState(status: AuthenticationStatus.unknow);
  factory AppState.authenticated() =>
      const AppState(status: AuthenticationStatus.authenticated);
  factory AppState.unauthenticated() =>
      const AppState(status: AuthenticationStatus.unauthenticated);
  @override
  List<Object?> get props => [status];
  AppState copyWith({AuthenticationStatus? status}) {
    return AppState(
      status: status ?? this.status,
    );
  }
}
