import 'package:ecomapp/core/Theme/entity/appTheme.dart';
import 'package:ecomapp/core/Utils/validators.dart';
import 'package:ecomapp/data/Models/userAuthModel.dart';
import 'package:ecomapp/presentation/Bloc/AuthBloc/auth_bloc.dart';
import 'package:ecomapp/presentation/CommonWidgets/elevatedButton.dart';
import 'package:ecomapp/presentation/Screens/Auth/Widgets/TextField.dart';
import 'package:ecomapp/presentation/Screens/Auth/Widgets/circleBorderImg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final _email = TextEditingController();
  final _passconf = TextEditingController();
  final _pass = TextEditingController();
  final appTheme = AppTheme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Account created! Welcome ${state.user.email}')));
            // Navigator.pop(context);
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Try with Another Mail Id")));
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
                SizedBox(height: 30),
                Text(
                  "Create an account",
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
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: _passconf,
                  label: "Confirm Password",
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
                SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    text: 'By clicking the',
                    style: TextStyle(
                      fontSize: 16,
                      color: appTheme.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' Register ',
                          style: TextStyle(
                            color: appTheme.red,
                          )),
                      TextSpan(
                          text: "button, you agree to the public offer",
                          style: TextStyle(color: appTheme.black))
                    ],
                  ),
                ),
                SizedBox(height: 20),
                CustomElevatedButton(
                  onpress: () {
                    if (isValidEmail(_email.text) &&
                        isValidPassword(_pass.text)) {
                      var _userdata = Userdata(
                          uid: "",
                          email: _email.text,
                          password: _pass.text,
                          name: "",
                          phone: "",
                          createdDate: DateTime.now().toString());
                      context.read<AuthBloc>().add(SignUpRequested(_userdata));
                    }
                  },
                  circleRadius: 5,
                  label: 'Create Account',
                ),
                SizedBox(height: 20),
                Text("- OR Continue with -"),
                SizedBox(
                  height: 20,
                ),
                Circleborderimg(),
                TextButton(
                  onPressed: () => context.push("/signin"),
                  child: RichText(
                    text: TextSpan(
                      text: 'I Already Have an Account  ',
                      style: TextStyle(
                          fontSize: 18,
                          color: appTheme.black,
                          fontWeight: FontWeight.w300),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Login',
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
