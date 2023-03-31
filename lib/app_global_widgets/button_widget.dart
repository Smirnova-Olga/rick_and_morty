import 'package:flutter/material.dart';
import 'package:rick_and_morty/ui_kit/ui_kit.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const ButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final style = AppTextTheme.subtitle1.copyWith(color: ColorTheme.white000);
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        backgroundColor: ColorTheme.blue900,
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}
