import 'package:ecomapp/core/Const/stripeConstants.dart';
import 'package:ecomapp/core/Router/appRouter.dart';
import 'package:ecomapp/core/Theme/entity/appTheme.dart';
import 'package:ecomapp/firebase_options.dart';
import 'package:ecomapp/presentation/Bloc/AuthBloc/auth_bloc.dart';
import 'package:ecomapp/presentation/Bloc/BottomNavBloc/BottomNavBloc.dart';
import 'package:ecomapp/presentation/Bloc/CartBloc/cart_bloc.dart';
import 'package:ecomapp/presentation/Bloc/PaymentBloc/payment_bloc.dart';
import 'package:ecomapp/presentation/Bloc/ShopBloc/shop_bloc.dart';
import 'package:ecomapp/presentation/Bloc/WishListBloc/wishlist_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'domain/Usecases/authUsecase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Stripe.publishableKey = stripePublicKey;
  await Stripe.instance.applySettings();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Authusecases _authRepository = Authusecases();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(_authRepository),
        ),
        BlocProvider(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider(
          create: (context) => WishlistBloc(),
        ),
        BlocProvider(
          create: (context) => ShopBloc(),
        ),
        BlocProvider(
          create: (context) => CartBloc(),
        ),
        BlocProvider(
          create: (context) => PaymentBloc(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter().config(),
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: AppTheme().appBg,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
