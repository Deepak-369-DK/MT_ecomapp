import 'package:ecomapp/presentation/Bloc/PaymentBloc/payment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Paymentscreen extends StatelessWidget {
  const Paymentscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PaymentBloc(),
      child: Scaffold(
        appBar: AppBar(title: Text('Stripe Payment')),
        body: BlocConsumer<PaymentBloc, PaymentState>(
          listener: (context, state) {
            if (state is PaymentSuccess) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Payment successful')));
            } else if (state is PaymentFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Oops... ${state.message}')));
            }
          },
          builder: (context, state) {
            if (state is PaymentLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<PaymentBloc>().add(StartPayment(25.0));
                },
                child: Text('Pay \$25'),
              ),
            );
          },
        ),
      ),
    );
  }
}
