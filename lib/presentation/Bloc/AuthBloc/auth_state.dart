part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  final bool passwordSecure;

  AuthInitial({required this.passwordSecure});

  AuthInitial copyWith({bool? isSecure}) {
    return AuthInitial(passwordSecure: isSecure ?? this.passwordSecure);
  }
}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final User user;

  AuthAuthenticated({required this.user});
}

class AuthSentResetEmail extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}
