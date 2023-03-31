import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty/gen/assets.gen.dart';
import 'package:rick_and_morty/ui_kit/ui_kit.dart';

class TextFieldWidget extends StatefulWidget {
  final bool isPassword;
  final String? text;

  const TextFieldWidget({
    Key? key,
    required this.isPassword,
    this.text,
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
