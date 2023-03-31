import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty/gen/assets.gen.dart';
import 'package:rick_and_morty/l10n/l10n.dart';
import 'package:rick_and_morty/ui_kit/ui_kit.dart';
import 'package:rick_and_morty/parts/auth/create_account_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n;
    final style = AppTextTheme.body2.copyWith(color: ColorTheme.white000);
    return SingleChildScrollView(
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
              TextFieldWidget(
                isPassword: false,
                text: locale.username,
              ),
              const SizedBox(height: 10),
              Text(locale.password, style: style),
              const SizedBox(height: 10),
              TextFieldWidget(
                isPassword: true,
                text: locale.password,
              ),
              const SizedBox(height: 30),
              const _ButtonLoginWidget(),
              const SizedBox(height: 20),
              const NewAccountWidget(),
            ],
          ),
        ),
      ),
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

class TextFieldWidget extends StatefulWidget {
  final bool isPassword;
  final String text;

  const TextFieldWidget({
    Key? key,
    required this.isPassword,
    required this.text,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
        textAlign: TextAlign.left,
        obscureText: widget.isPassword ? true : false,
        obscuringCharacter: '•',
        style: TextStyle(
          color: ColorTheme.white000,
          fontWeight: FontWeight.w400,
          letterSpacing: widget.isPassword ? 1 : 5,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          filled: true,
          fillColor: ColorTheme.grey,
          prefixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 20, 12),
            child: SvgPicture.asset(
              widget.isPassword
                  ? Assets.icons.userIcon.path
                  : Assets.icons.passwordIcon.path,
              color: ColorTheme.white100,
            ),
          ),
          hintText: widget.text,
          hintStyle: AppTextTheme.body1.copyWith(color: ColorTheme.white100),
          suffixIcon: widget.isPassword
              ? null
              : IconButton(
                  icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off),
                  color: ColorTheme.white000,
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
        ));
  }
}

class _ButtonLoginWidget extends StatelessWidget {
  const _ButtonLoginWidget();

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n;
    final style = AppTextTheme.subtitle1.copyWith(color: ColorTheme.white000);
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        backgroundColor: ColorTheme.blue900,
      ),
      onPressed: () => _showDialogMessage(context),
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Text(
          locale.login,
          style: style,
        ),
      ),
    );
  }

  Future<String?> _showDialogMessage(BuildContext context) {
    final locale = context.l10n;
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        actionsPadding: const EdgeInsets.all(30),
        backgroundColor: ColorTheme.blue700,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        title: Text(locale.error),
        titlePadding: const EdgeInsets.all(30),
        titleTextStyle:
            AppTextTheme.headline6.copyWith(color: ColorTheme.white000),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(locale.incorrectData),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 30),
        contentTextStyle:
            AppTextTheme.body2.copyWith(color: ColorTheme.white000),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              minimumSize: const Size.fromHeight(30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                side: const BorderSide(color: ColorTheme.blue900),
              ),
            ),
            onPressed: () => Navigator.pop(context, locale.ok),
            child: Text(
              locale.ok,
              style: AppTextTheme.subtitle1.copyWith(color: ColorTheme.blue900),
            ),
          ),
        ],
      ),
    );
  }
}

class NewAccountWidget extends StatelessWidget {
  const NewAccountWidget({
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
                    builder: (context) => const CreateAccountWidget()),
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
