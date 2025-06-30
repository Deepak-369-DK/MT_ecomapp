import 'package:ecomapp/core/Const/assetspath.dart';
import 'package:ecomapp/core/Theme/entity/appTheme.dart';
import 'package:ecomapp/presentation/Bloc/PaymentBloc/payment_bloc.dart';
import 'package:ecomapp/presentation/CommonWidgets/appbar.dart';
import 'package:ecomapp/presentation/CommonWidgets/elevatedButton.dart';
import 'package:ecomapp/presentation/Screens/Home/Widgets/bottomNavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Shippingscreen extends StatelessWidget {
  double amt;

  Shippingscreen(this.amt);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.NormalAppbar(
        centerTitle: "Checkout",
        leadingOnPress: () => context.pop(),
      ),
      body: BlocConsumer<PaymentBloc, PaymentState>(
        listener: (context, state) {
          if (state is PaymentSuccess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Payment successful')));
          } else if (state is PaymentFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.message}')));
          }
        },
        builder: (context, state) {
          if (state is PaymentLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text('Order',
                          style: TextStyle(color: Colors.grey, fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('₹ ${amt.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.grey)),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text('Shipping',
                          style: TextStyle(color: Colors.grey, fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('₹ 30',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.grey)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black)),
                    Text('₹ ${(amt + 30).toStringAsFixed(2)}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black)),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(thickness: 1, height: 30),
                const SizedBox(height: 20),
                const Text('Payment',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black)),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () =>
                      context.read<PaymentBloc>().add(SelectPayment(true)),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: (state is PaymentInitial)
                              ? state.isStripe
                                  ? Colors.red
                                  : Colors.white
                              : Colors.white),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              '${Img_icons}strip.png',
                              height: 25,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                        const Text(
                          '********2109',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () =>
                      context.read<PaymentBloc>().add(SelectPayment(false)),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: (state is PaymentInitial)
                              ? !state.isStripe
                                  ? Colors.red
                                  : Colors.white
                              : Colors.white),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: AppTheme().white,
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                  image: AssetImage('${Img_icons}apple.png'))),
                        ),
                        const Text(
                          '********2109',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                CustomElevatedButton(
                  label: (state is PaymentLoading) ? "..." : "Continue",
                  onpress: () =>
                      context.read<PaymentBloc>().add(StartPayment(amt + 30)),
                )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
