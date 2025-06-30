import 'package:bloc/bloc.dart';
import 'package:ecomapp/data/Models/userAuthModel.dart';
import 'package:ecomapp/domain/Repository/authRepository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repo;

  AuthBloc(this.repo) : super(AuthInitial(passwordSecure: true)) {
    on<SignInRequested>((e, emit) async {
      emit(AuthLoading());
      try {
        final user = await repo.signIn(e.email, e.password);
        emit(user != null
            ? AuthAuthenticated(user: user)
            : AuthError('Unknown error'));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<SignUpRequested>((e, emit) async {
      emit(AuthLoading());
      try {
        final user = await repo.signUp(e.userdata);
        emit(user != null
            ? AuthAuthenticated(user: user)
            : AuthError('Unknown error'));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<ForgotPasswordRequested>((e, emit) async {
      emit(AuthLoading());
      try {
        await repo.sendPasswordReset(e.email);
        emit(AuthSentResetEmail());
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<AuthLogoutRequested>((e, emit) async {
      await FirebaseAuth.instance.signOut();
      emit(AuthInitial(passwordSecure: true));
    });

    on<AuthPassView>((e, emit) {
      if (state is AuthInitial) {
        final current = (state as AuthInitial).passwordSecure;
        emit(AuthInitial(passwordSecure: !current));
      }
    });
  }
}
