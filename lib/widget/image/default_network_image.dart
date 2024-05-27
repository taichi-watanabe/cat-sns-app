import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:octo_image/octo_image.dart';

import '../../../foundation/constant/app_colors.dart';

class DefaultNetworkImage extends HookWidget {
  const DefaultNetworkImage(
      {super.key,
      required this.imageUrl,
      required this.width,
      required this.height,
      this.borderRadius = 0,
      this.iconSize = 36});

  final String? imageUrl;
  final double width;
  final double height;
  final double borderRadius;
  final double iconSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: imageUrl != null
            ? Image(
                image: CachedNetworkImageProvider(imageUrl!),
                errorBuilder: OctoError.icon(
                    color: AppColors.iconGreyDark, icon: Icons.error_outline),
                fit: BoxFit.cover,
              )
            : Icon(
                Icons.error_outline,
                color: AppColors.iconGreyDark,
                size: iconSize,
              ),
      ),
    );
  }
}
