part of '../ui_kit/ui_kit.dart';

class FindTextFieldWidget extends StatelessWidget {
  final String hintText;
  final bool withSuffixIcon;
  final ValueChanged<String> onSearched;

  const FindTextFieldWidget({
    Key? key,
    required this.hintText,
    required this.withSuffixIcon,
    required this.onSearched,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onSearched,
      textAlign: TextAlign.left,
      style: const TextStyle(
        color: ColorTheme.white100Dark,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          borderSide: BorderSide(style: BorderStyle.none),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          borderSide: BorderSide(style: BorderStyle.none),
        ),
        filled: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(15, 12, 10, 12),
          child: SvgPicture.asset(Assets.icons.search.path),
        ),
        hintText: hintText,
        hintStyle: AppTextTheme.body1.copyWith(color: ColorTheme.white100Dark),
        suffixIcon: withSuffixIcon
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 24,
                    width: 1,
                    color: ColorTheme.white100Dark,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 12, 15, 12),
                    child: SvgPicture.asset(Assets.icons.filter.path),
                  ),
                ],
              )
            : null,
      ),
    );
  }
}
