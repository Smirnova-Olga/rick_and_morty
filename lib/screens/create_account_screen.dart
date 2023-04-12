import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/app_global_widgets/button_widget.dart';
import 'package:rick_and_morty/app_global_widgets/devider_widget.dart';
import 'package:rick_and_morty/app_global_widgets/text_field_widgets.dart';
import 'package:rick_and_morty/l10n/l10n.dart';
import 'package:rick_and_morty/parts/auth/bloc/auth_bloc.dart';
import 'package:rick_and_morty/parts/home/home_part.dart';
import 'package:rick_and_morty/services/snack_bar_service.dart';
import 'package:rick_and_morty/ui_kit/ui_kit.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _isObscure = true;
  final TextEditingController _nameInputController = TextEditingController();
  final TextEditingController _surnameInputController = TextEditingController();
  final TextEditingController _emailInputController = TextEditingController();
  final TextEditingController _passwordInputController =
      TextEditingController();
  final TextEditingController _passwordRepeatInputController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailInputController.dispose();
    _passwordInputController.dispose();
    _passwordRepeatInputController.dispose();
    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n;
    final style = AppTextTheme.headline7.copyWith(color: ColorTheme.white100);
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            // Navigating to the dashboard screen if the user is authenticated
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const CreateAccountScreen(),
              ),
            );
          }
          if (state is AuthError) {
            // Displaying the error message if the user is not authenticated
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is Loading) {
            // Displaying the loading indicator while the user is signing up
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UnAuthenticated) {
            // Displaying the sign up form if the user is not authenticated
            return Form(
              key: _formKey,
              child: Container(
                decoration: const BoxDecoration(color: ColorTheme.voilet),
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          locale.createAccount,
                          style: style,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: _HelpTextWidget(text: locale.name),
                      ),
                      TextFieldWidget(
                        hintText: locale.name,
                        textInputController: _nameInputController,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: _HelpTextWidget(text: locale.surname),
                      ),
                      TextFieldWidget(
                        hintText: locale.surname,
                        textInputController: _surnameInputController,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: DividerWidget(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: _HelpTextWidget(text: locale.username),
                      ),
                      EmailFormField(
                        emailTextInputController: _emailInputController,
                        locale: locale,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: _HelpTextWidget(text: locale.password),
                      ),
                      PasswordFormField(
                        passwordTextInputController: _passwordInputController,
                        locale: locale,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: _HelpTextWidget(text: locale.password),
                      ),
                      PasswordFormField(
                        passwordTextInputController:
                            _passwordRepeatInputController,
                        locale: locale,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: ButtonWidget(
                          text: locale.create,
                          onPressed: () {
                            if (_passwordInputController.text !=
                                _passwordRepeatInputController.text) {
                              SnackBarService.showDialogMessage(
                                context,
                                locale.passwordMismatch,
                              );
                            } else if (_formKey.currentState!.validate()) {
                              _createAccountWithEmailAndPassword(context);
                            } else {
                              SnackBarService.showDialogMessage(
                                context,
                                locale.unknownError,
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const HomeScreen();
        },
      ),
    );
  }

  _createAccountWithEmailAndPassword(BuildContext context) {
    return BlocProvider.of<AuthBloc>(context).add(
      SignUpRequested(
        _emailInputController.text,
        _passwordInputController.text,
      ),
    );
  }
}

class _HelpTextWidget extends StatelessWidget {
  final String text;
  const _HelpTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextTheme.body2.copyWith(
        color: ColorTheme.white000,
      ),
    );
  }
}
