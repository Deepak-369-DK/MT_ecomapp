part of 'payment_bloc.dart';

sealed class PaymentState {}

class PaymentInitial extends PaymentState {
  bool isStripe;

  PaymentInitial(this.isStripe);
}

class PaymentLoading extends PaymentState {}

class PaymentSuccess extends PaymentState {}

class PaymentFailure extends PaymentState {
  final String message;

  PaymentFailure(this.message);
}
