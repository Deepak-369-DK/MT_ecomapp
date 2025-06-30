import 'package:ecomapp/domain/Usecases/paymentUsecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payment_event.dart';

part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final ProcessPayment processPayment;

  PaymentBloc()
      : processPayment = ProcessPayment(Paymentusecases()),
        super(PaymentInitial(true)) {
    on<StartPayment>((event, emit) async {
      emit(PaymentLoading());
      try {
        await processPayment(event.amount);
        emit(PaymentSuccess());
      } catch (e) {
        emit(PaymentFailure("Payment Failed"));
      }
    });

    on<SelectPayment>((event, emit) {
      emit(PaymentInitial(event.isStripe));
    });
  }
}
