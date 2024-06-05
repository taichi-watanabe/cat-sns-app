import 'package:cat_sns_app/foundation/constant/app_colors.dart';
import 'package:cat_sns_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final passwordDisplayProvider = StateProvider<bool>((ref) => true);

class AppForm extends ConsumerWidget {
  AppForm(
      {super.key,
      this.hintText,
      this.validationCallBack,
      this.onChanged,
      this.isIconVisible = false,
      this.textInputType = TextInputType.text,
      this.controller,
      this.focusNode,
      this.fieldKey,
      this.digitsOnly = false,
      this.useHelperText = false,
      this.bottomScrollPadding = 20,
      this.initialValue,
      this.readOnly = false,
      this.autocorrect = true,
      this.borderSelect = true,
      this.fillColor,
      this.filled = false,
      this.hintSize,
      this.horizontalPadding = 12,
      this.verticalPadding = 8});

  final String? hintText;
  final Function? validationCallBack;
  Function(String)? onChanged;
  final TextInputType textInputType;
  final bool isIconVisible;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final GlobalKey<FormFieldState<dynamic>>? fieldKey;
  final bool digitsOnly;
  final bool useHelperText;
  final double bottomScrollPadding;
  final String? initialValue;
  final bool readOnly;
  final bool autocorrect;
  final bool borderSelect;
  final Color? fillColor;
  final bool filled;
  final double? hintSize;
  final double horizontalPadding;
  final double verticalPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _passwordDisplayNotifier =
        ref.watch(passwordDisplayProvider.notifier);
    final _hidePassword = ref.watch(passwordDisplayProvider);

    return TextFormField(
      cursorColor: AppColors.primary,
      autocorrect: autocorrect,
      scrollPadding: EdgeInsets.only(bottom: bottomScrollPadding),
      key: fieldKey,
      readOnly: readOnly,
      focusNode: focusNode,
      onChanged: onChanged,
      keyboardType: textInputType,
      inputFormatters: digitsOnly
          ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
          : null,
      textInputAction: TextInputAction.next,
      textAlignVertical: TextAlignVertical.bottom,
      obscureText: isIconVisible ? _hidePassword : false,
      autovalidateMode: AutovalidateMode.disabled,
      validator: (value) =>
          validationCallBack != null ? validationCallBack!(value) : null,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.primary, width: 2)),
        fillColor: fillColor,
        filled: filled,
        isDense: true,
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.borderMiddle, fontSize: hintSize),
        border: borderSelect
            ? const OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.borderMiddle,
                ),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.backGround,
                ),
              ),
        enabledBorder: borderSelect
            ? const OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.borderMiddle,
                ),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.backGround,
                ),
              ),
        helperText: useHelperText ? ' ' : null,
        errorMaxLines: 2,
        contentPadding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding),
        suffixIconConstraints:
            const BoxConstraints(minHeight: 24, minWidth: 24),
        suffixIcon: isIconVisible
            ? SizedBox(
                height: 18,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: InkWell(
                      onTap: () => _hidePassword
                          ? _passwordDisplayNotifier.state = false
                          : _passwordDisplayNotifier.state = true,
                      child: _hidePassword
                          ? SvgPicture.asset(Assets.images.svg.eye)
                          : SvgPicture.asset(Assets.images.svg.eye)),
                ))
            : null,
      ),
      controller: controller,
      initialValue: initialValue,
    );
  }
}
