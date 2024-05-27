import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cat_sns_app/foundation/constant/app_colors.dart';

final passwordDisplayProvider = StateProvider<bool>((ref) => true);

class AppForm extends ConsumerWidget {
  AppForm({
    super.key,
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
  });

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _passwordDisplayNotifier =
        ref.watch(passwordDisplayProvider.notifier);
    final _hidePassword = ref.watch(passwordDisplayProvider);

    return TextFormField(
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
        isDense: true,
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.borderMiddle),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.borderMiddle,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.borderMiddle,
          ),
        ),
        helperText: useHelperText ? ' ' : null,
        errorMaxLines: 2,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        suffixIconConstraints:
            const BoxConstraints(minHeight: 24, minWidth: 24),
        suffixIcon: isIconVisible
            ? SizedBox(
                height: 18,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 17,
                  onPressed: () => _hidePassword
                      ? _passwordDisplayNotifier.state = false
                      : _passwordDisplayNotifier.state = true,
                  icon: Icon(
                    color: AppColors.iconGreyDark,
                    _hidePassword
                        ? FontAwesomeIcons.solidEyeSlash
                        : FontAwesomeIcons.solidEye,
                    size: 17,
                  ),
                ),
              )
            : null,
      ),
      controller: controller,
      initialValue: initialValue,
    );
  }
}
