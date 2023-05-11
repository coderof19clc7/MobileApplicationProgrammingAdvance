import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/presentations/widgets/others/simple_network_image.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    this.isEditAvt = false,
    this.currentUrl,
    this.path = '',
    this.onSelectedAva,
  });

  final bool isEditAvt;
  final String? currentUrl;
  final String path;
  final void Function(String)? onSelectedAva;

  Future<void> showImagePicker() async {
    try {
      final newAvatar = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (newAvatar != null) {
        onSelectedAva?.call(newAvatar.path);
      }
    } catch (e) {
      if (e is PlatformException) {
        log('code: ${e.code}\nmessage: ${e.message}');
      } else {
        log(e.toString(), name: 'AvatarWidget.showImagePicker');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final avaSize = Dimens.getScreenWidth(context) * 0.31;
    return Stack(
      children: [
        ClipOval(
          child: path.isEmpty
              ? SimpleNetworkImage(
            url: currentUrl,
            width: avaSize,
            height: avaSize,
          )
              : Image.file(
            File(path),
            width: avaSize,
            height: avaSize,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return DecoratedBox(
                decoration: BoxDecoration(color: AppColors.grey),
                child: const Icon(Icons.error),
              );
            },
          ),
        ),
        Visibility(
          visible: isEditAvt,
          child: Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: showImagePicker,
              child: Container(
                width: avaSize / 3,
                height: avaSize / 3,
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.camera_alt_rounded,
                  color: context.theme.colorScheme.onPrimary,
                  size: avaSize / 5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
