// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/app_global_widgets/button_widget.dart';
import 'package:rick_and_morty/app_global_widgets/text_field_widgets.dart';
import 'package:rick_and_morty/l10n/l10n.dart';
import 'package:rick_and_morty/parts/auth/bloc/auth_bloc.dart';
import 'package:rick_and_morty/parts/home/home_part.dart';
import 'package:rick_and_morty/screens/create_account_screen.dart';
import 'package:rick_and_morty/services/snack_bar_service.dart';
import 'package:rick_and_morty/ui_kit/ui_kit.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailInputController = TextEditingController();
  final TextEditingController _passwordInputController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailInputController.dispose();
    _passwordInputController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n;
    final style = AppTextTheme.body2.copyWith(color: ColorTheme.white000);
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            // Navigating to the dashboard screen if the user is authenticated
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const CreateAccountScreen()));
          }
          if (state is AuthError) {
            // Showing the error message if the user has entered invalid credentials
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Loading) {
              // Showing the loading indicator while the user is signing in
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UnAuthenticated) {
              // Showing the sign in form if the user is not authenticated
              return Material(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Container(
                      decoration: const BoxDecoration(color: ColorTheme.voilet),
                      child: Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 50),
                            const _BackgroundImageWidget(),
                            Text(locale.username, style: style),
                            const SizedBox(height: 10),
                            EmailFormField(
                              emailTextInputController: _emailInputController,
                              locale: locale,
                            ),
                            const SizedBox(height: 10),
                            Text(locale.password, style: style),
                            const SizedBox(height: 10),
                            PasswordFormField(
                              passwordTextInputController:
                                  _passwordInputController,
                              locale: locale,
                            ),
                            const SizedBox(height: 30),
                            ButtonWidget(
                              text: locale.login,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _authenticateWithEmailAndPassword(context);
                                } else {
                                  SnackBarService.showDialogMessage(
                                    context,
                                    locale.unknownError,
                                  );
                                }
                              },
                            ),
                            const SizedBox(height: 20),
                            const _NewAccountWidget(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
            return const HomeScreen();
          },
        ),
      ),
    );
  }

  _authenticateWithEmailAndPassword(BuildContext context) async {
    BlocProvider.of<AuthBloc>(context).add(
      SignInRequested(
          _emailInputController.text, _passwordInputController.text),
    );
  }
}

class _BackgroundImageWidget extends StatelessWidget {
  const _BackgroundImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Image(
        image: AssetImage('assets/images/text_image.png'),
      ),
    );
  }
}

class _NewAccountWidget extends StatelessWidget {
  const _NewAccountWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n;
    final style = AppTextTheme.body2.copyWith(color: ColorTheme.white100);
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          locale.doNotHaveAnAccountYet,
          style: style,
        ),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CreateAccountScreen()),
              );
            },
            child: Text(
              locale.create,
              style: style.copyWith(color: ColorTheme.green),
            ))
      ],
    );
  }
}
