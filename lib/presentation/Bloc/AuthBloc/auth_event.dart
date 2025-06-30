part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInRequested extends AuthEvent {
  final String email, password;

  SignInRequested(this.email, this.password);
}

class SignUpRequested extends AuthEvent {
  final Userdata userdata;

  SignUpRequested(this.userdata);
}

class ForgotPasswordRequested extends AuthEvent {
  final String email;

  ForgotPasswordRequested(this.email);
}

class AuthLogoutRequested extends AuthEvent {}

class AuthPassView extends AuthEvent {
  bool passwordSecure;

  AuthPassView({required this.passwordSecure});
}
