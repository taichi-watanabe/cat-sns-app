import 'package:cat_sns_app/foundation/constant/app_colors.dart';
import 'package:cat_sns_app/widget/text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

class EditContainer extends HookWidget {
  const EditContainer(
    this.title,
    this.detail,
    this.tappedEdit, {
    Key? key,
  }) : super(key: key);

  final String title;
  final String detail;
  final VoidCallback? tappedEdit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: title,
          color: AppColors.textMiddle,
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColors.borderDark),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: AppText(
                    text: detail,
                    fontSize: 16,
                    color: AppColors.textLink,
                    lineHeight: 1.2,
                  ),
                ),
              ),
              Visibility(
                visible: tappedEdit != null,
                child: InkWell(
                  onTap: tappedEdit,
                  child: SizedBox(
                    height: 44,
                    child: Row(
                      children: [
                        const SizedBox(width: 5),
                        SvgPicture.asset('assets/images/svg/edit.svg'),
                        const SizedBox(width: 8),
                        const AppText(
                          text: '修正',
                          fontSize: 14,
                          color: AppColors.textLink,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
