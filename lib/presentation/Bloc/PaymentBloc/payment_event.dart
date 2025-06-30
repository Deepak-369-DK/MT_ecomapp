part of 'payment_bloc.dart';

class PaymentEvent {}

class StartPayment extends PaymentEvent {
  final double amount;

  StartPayment(this.amount);
}

class SelectPayment extends PaymentEvent {
  final bool isStripe;

  SelectPayment(this.isStripe);
}
