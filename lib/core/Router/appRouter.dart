import 'package:ecomapp/data/Models/cartModel.dart';
import 'package:ecomapp/presentation/Screens/Auth/Screens/SignUpScreen.dart';
import 'package:ecomapp/presentation/Screens/Auth/Screens/forgotPasswordScreen.dart';
import 'package:ecomapp/presentation/Screens/Auth/Screens/signInScreen.dart';
import 'package:ecomapp/presentation/Screens/CheckOut/checkoutScreen.dart';
import 'package:ecomapp/presentation/Screens/Home/Widgets/getStart.dart';
import 'package:ecomapp/presentation/Screens/Home/homeScreen.dart';
import 'package:ecomapp/presentation/Screens/Payment/paymentScreen.dart';
import 'package:ecomapp/presentation/Screens/PlaceOrder/placeOrderScreen.dart';
import 'package:ecomapp/presentation/Screens/ShippingScreen/shippingScreen.dart';
import 'package:ecomapp/presentation/Screens/ShopScreen/shopScreen.dart';
import 'package:ecomapp/presentation/Screens/SplashScreen/multiSplashScreen.dart';
import 'package:ecomapp/presentation/Screens/SplashScreen/splasScreen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  GoRouter config() => GoRouter(
        routes: [
          GoRoute(path: '/', builder: (context, state) => Splasscreen()),
          GoRoute(
              path: '/multiSplash',
              builder: (context, state) => MultiSplashScreen()),
          GoRoute(path: '/signin', builder: (context, state) => SigninScreen()),
          GoRoute(path: '/signup', builder: (context, state) => SignupScreen()),
          GoRoute(
              path: '/forgotPassword',
              builder: (context, state) => ForgotPasswordScreen()),
          GoRoute(path: '/getStart', builder: (context, state) => Getstart()),
          GoRoute(path: '/home', builder: (context, state) => Homescreen()),
          GoRoute(
              path: '/payment', builder: (context, state) => Paymentscreen()),
          GoRoute(
              path: '/shopScreen', builder: (context, state) => ShopScreen()),
          GoRoute(
              path: '/cartList', builder: (context, state) => Checkoutscreen()),
          GoRoute(
              path: '/placeorder',
              builder: (context, state) {
                final item = state.extra as Cartmodel;
                return Placeorderscreen(item);
              }),
          GoRoute(
              path: '/shipping',
              builder: (context, state) {
                double amt = state.extra as double;
                return Shippingscreen(amt);
              }),
        ],
      );
}
