import 'package:flutter/material.dart';
import 'package:rick_and_morty/l10n/l10n.dart';
import 'package:rick_and_morty/ui_kit/ui_kit.dart';

class SnackBarService {
  static Future<String?> showDialogMessage(
      BuildContext context, String message) {
    final locale = context.l10n;
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        actionsPadding: const EdgeInsets.all(30),
        backgroundColor: ColorTheme.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        title: Text(message),
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
