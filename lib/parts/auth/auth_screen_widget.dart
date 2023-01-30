import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty/gen/assets.gen.dart';
import 'package:rick_and_morty/ui_kit/ui_kit.dart';
import 'package:rick_and_morty/parts/auth/create_account_widget.dart';

class AuthScreenWidget extends StatelessWidget {
  const AuthScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(color: ColorTheme.voilet),
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 50),
              _BackgroundImageWidget(),
              _TextWidget(text: 'Username'),
              SizedBox(height: 10),
              TextFieldWidget(
                isLoginText: true,
              ),
              SizedBox(height: 10),
              _TextWidget(text: 'Password'),
              SizedBox(height: 10),
              TextFieldWidget(
                isLoginText: false,
              ),
              SizedBox(height: 30),
              _ButtonLoginWidget(),
              SizedBox(height: 20),
              NewAccountWidget(),
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

class _TextWidget extends StatelessWidget {
  final String text;
  const _TextWidget({
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

class TextFieldWidget extends StatefulWidget {
  final bool isLoginText;

  const TextFieldWidget({
    Key? key,
    required this.isLoginText,
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
        obscureText: widget.isLoginText ? false : _isObscure,
        obscuringCharacter: '•',
        style: TextStyle(
          color: ColorTheme.white000,
          fontWeight: FontWeight.w400,
          letterSpacing: widget.isLoginText ? 1 : 5,
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
              widget.isLoginText
                  ? Assets.icons.userIcon.path
                  : Assets.icons.passwordIcon.path,
              color: ColorTheme.white100,
            ),
          ),
          hintText: widget.isLoginText ? 'Username' : 'Password',
          hintStyle: AppTextTheme.body1.copyWith(color: ColorTheme.white100),
          suffixIcon: widget.isLoginText
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
          'Login',
          style: AppTextTheme.subtitle1.copyWith(
            color: ColorTheme.white000,
          ),
        ),
      ),
    );
  }

  Future<String?> _showDialogMessage(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        actionsPadding: const EdgeInsets.all(30),
        backgroundColor: ColorTheme.blue700,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        title: const Text('Error'),
        titlePadding: const EdgeInsets.all(30),
        titleTextStyle:
            AppTextTheme.headline6.copyWith(color: ColorTheme.white000),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Text('Incorrect username or password'),
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
            onPressed: () => Navigator.pop(context, 'OK'),
            child: Text(
              'OK',
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
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account yet?",
          style: AppTextTheme.body2.copyWith(color: ColorTheme.white100),
        ),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CreateAccountWidget()),
              );
            },
            child: const Text(
              'Create',
              style: TextStyle(color: ColorTheme.green),
            ))
      ],
    );
  }
}
