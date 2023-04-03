import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty/app_global_widgets/button_widget.dart';
import 'package:rick_and_morty/app_global_widgets/devider_widget.dart';
import 'package:rick_and_morty/app_global_widgets/text_field_widgets.dart';
import 'package:rick_and_morty/gen/assets.gen.dart';
import 'package:rick_and_morty/l10n/l10n.dart';
import 'package:rick_and_morty/services/snack_bar_service.dart';
import 'package:rick_and_morty/ui_kit/ui_kit.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _isObscure = true;
  TextEditingController nameInputController = TextEditingController();
  TextEditingController surnameInputController = TextEditingController();
  TextEditingController emailInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();
  TextEditingController passwordRepeatInputController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailInputController.dispose();
    passwordInputController.dispose();
    passwordRepeatInputController.dispose();

    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  Future<void> signUp() async {
    final navigator = Navigator.of(context);
    final locale = context.l10n;

    final isValid = formKey.currentState?.validate();
    if (isValid == null) {
      SnackBarService.showDialogMessage(
        context,
        locale.unknownError,
      );
    } else if (!isValid) {
      return;
    }

    if (passwordInputController.text != passwordRepeatInputController.text) {
      SnackBarService.showDialogMessage(
        context,
        locale.passwordMismatch,
      );
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailInputController.text.trim(),
        password: passwordInputController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);

      if (e.code == 'email-already-in-use') {
        SnackBarService.showDialogMessage(
          context,
          locale.emailIsAlreadyInUse,
        );
        return;
      } else {
        SnackBarService.showDialogMessage(
          context,
          locale.unknownError,
        );
      }
    }

    navigator.pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n;
    final style = AppTextTheme.headline7.copyWith(color: ColorTheme.white100);
    return Scaffold(
      appBar: AppBar(
        leading: const _BackButtonWidget(),
        leadingWidth: 90,
        backgroundColor: ColorTheme.voilet,
        elevation: 0,
      ),
      body: Container(
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
                textInputController: nameInputController,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: _HelpTextWidget(text: locale.surname),
              ),
              TextFieldWidget(
                hintText: locale.surname,
                textInputController: surnameInputController,
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
                emailTextInputController: emailInputController,
                locale: locale,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: _HelpTextWidget(text: locale.password),
              ),
              PasswordFormField(
                passwordTextInputController: passwordInputController,
                locale: locale,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: _HelpTextWidget(text: locale.password),
              ),
              PasswordFormField(
                passwordTextInputController: passwordRepeatInputController,
                locale: locale,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ButtonWidget(
                  text: locale.create,
                  onPressed: () {
                    signUp();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BackButtonWidget extends StatelessWidget {
  const _BackButtonWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      height: 36,
      child: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: SvgPicture.asset(
          Assets.icons.back.path,
          color: ColorTheme.white000,
        ),
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
