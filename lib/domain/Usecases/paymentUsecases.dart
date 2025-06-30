import 'dart:convert';

import 'package:ecomapp/core/Const/stripeConstants.dart';
import 'package:ecomapp/domain/Repository/paymentRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class ProcessPayment {
  final PaymentRepository repository;

  ProcessPayment(this.repository);

  Future<void> call(double amount) async {
    await repository.process(amount);
  }
}

class Paymentusecases implements PaymentRepository {
  @override
  Future<void> process(double amount) async {
    try {
      final data = await createPaymentIntent(amount: amount, currency: "usd");
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: data['client_secret'].toString(),
          merchantDisplayName: '',
          style: ThemeMode.light, // optional
        ),
      );
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> createPaymentIntent({
    required double amount,
    required String currency,
  }) async {
    try {
      var body = jsonEncode({
        'amount': (amount * 100).toInt(),
        'currency': currency,
      });
      print(body);

      final url = Uri.parse("https://api.stripe.com/v1/payment_intents");
      final response = await http.post(
        url,
        headers: {
          "Authorization": "Bearer $stripeSecKey",
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'amount': (amount * 100).toInt().toString(),
          'currency': currency,
          'automatic_payment_methods[enabled]': 'true',
        },
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        print('Failed to create payment intent: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error creating payment intent: $e');
      return null;
    }
  }
}
