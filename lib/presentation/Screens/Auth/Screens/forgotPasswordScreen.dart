import 'package:ecomapp/core/Theme/entity/appTheme.dart';
import 'package:ecomapp/core/Utils/validators.dart';
import 'package:ecomapp/presentation/Bloc/AuthBloc/auth_bloc.dart';
import 'package:ecomapp/presentation/CommonWidgets/elevatedButton.dart';
import 'package:ecomapp/presentation/Screens/Auth/Widgets/TextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final _email = TextEditingController();
  final appTheme = AppTheme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSentResetEmail) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Reset email sent!')));
            Navigator.pop(context);
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading)
            return Center(child: CircularProgressIndicator());

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              SizedBox(height: 30),
              Text(
                "Forgot password?",
                style: TextStyle(
                    fontSize: appTheme.FontSizeHeading_Auth,
                    fontWeight: appTheme.Fontweight_Heading),
              ),
              SizedBox(height: 30),
              CustomTextField(
                controller: _email,
                label: "Enter your email address",
                bgColor: appTheme.grey_bg,
                leadIcon: Icons.mail,
              ),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: '',
                  children: <TextSpan>[
                    TextSpan(
                      text: ' *  ',
                      style: TextStyle(
                        color: appTheme.red,
                      ),
                    ),
                    TextSpan(
                        text:
                            'We will send you a message to set or reset your new password',
                        style: TextStyle(
                            color: appTheme.black,
                            fontWeight: FontWeight.w300)),
                  ],
                ),
              ),
              SizedBox(height: 20),
              CustomElevatedButton(
                onpress: () {
                  if (isValidEmail(_email.text)) {
                    context
                        .read<AuthBloc>()
                        .add(ForgotPasswordRequested(_email.text));
                  }
                },
                circleRadius: 5,
                label: 'Submit',
              ),
            ]),
          );
        },
      ),
    );
  }
}
