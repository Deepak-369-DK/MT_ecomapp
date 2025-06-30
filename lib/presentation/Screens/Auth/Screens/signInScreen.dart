import 'package:ecomapp/core/Theme/entity/appTheme.dart';
import 'package:ecomapp/core/Utils/validators.dart';
import 'package:ecomapp/presentation/Bloc/AuthBloc/auth_bloc.dart';
import 'package:ecomapp/presentation/CommonWidgets/elevatedButton.dart';
import 'package:ecomapp/presentation/CommonWidgets/snacbar.dart';
import 'package:ecomapp/presentation/Screens/Auth/Widgets/TextField.dart';
import 'package:ecomapp/presentation/Screens/Auth/Widgets/circleBorderImg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  final _email = TextEditingController();
  final _pass = TextEditingController();
  final appTheme = AppTheme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Welcome ${state.user.email}!')));
            context.go("/getStart");
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Try Another Mail Id")));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading)
            return Center(child: CircularProgressIndicator());
          return Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                      fontSize: appTheme.FontSizeHeading_Auth,
                      fontWeight: appTheme.Fontweight_Heading),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: _email,
                  label: "Username or Email",
                  bgColor: appTheme.grey_bg,
                  leadIcon: Icons.person,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: _pass,
                  label: "Password",
                  bgColor: appTheme.grey_bg,
                  leadIcon: Icons.lock,
                  textSecure:
                      (state is AuthInitial) ? state.passwordSecure : true,
                  endIcon: IconButton(
                      onPressed: () {
                        if (state is AuthInitial) {
                          context.read<AuthBloc>().add(AuthPassView(
                              passwordSecure: state.passwordSecure));
                        }
                      },
                      icon: Icon(Icons.remove_red_eye_outlined)),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      onPressed: () => context.push("/forgotPassword"),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: appTheme.red),
                      )),
                ),
                SizedBox(height: 25),
                CustomElevatedButton(
                  label: "Login",
                  circleRadius: 5,
                  onpress: () {
                    if (isValidEmail(_email.text) &&
                        isValidPassword(_pass.text)) {
                      context
                          .read<AuthBloc>()
                          .add(SignInRequested(_email.text, _pass.text));
                    } else {
                      ShowSnackBar()
                          .snackBar(context, message: "Invalid credentials");
                    }
                  },
                ),
                SizedBox(
                  height: 70,
                ),
                Text("- OR Continue with -"),
                SizedBox(
                  height: 20,
                ),
                Circleborderimg(),
                TextButton(
                  onPressed: () => context.push("/signup"),
                  child: RichText(
                    text: TextSpan(
                      text: 'Create An Account  ',
                      style: TextStyle(
                          fontSize: 18,
                          color: appTheme.black,
                          fontWeight: FontWeight.w300),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: appTheme.red,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.red,
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
