import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../model/User.dart';

enum AuthenticationStatus { unknow, authenticated, unauthenticated }

@immutable
class AppState extends Equatable {
  final AuthenticationStatus status;

  final User? user;
  const AppState({required this.status, required this.user});
  factory AppState.unknow() =>
      const AppState(status: AuthenticationStatus.unknow, user: null);
  factory AppState.authenticated(User user) =>
      AppState(status: AuthenticationStatus.authenticated, user: user);
  factory AppState.unauthenticated() =>
      const AppState(status: AuthenticationStatus.unauthenticated, user: null);
  @override
  List<Object?> get props => [user, status];
  AppState copyWith({AuthenticationStatus? status, User? user}) {
    return AppState(
      user: user ?? this.user,
      status: status ?? this.status,
    );
  }
}
