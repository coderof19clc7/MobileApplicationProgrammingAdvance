import 'package:flutter/material.dart';
import 'package:one_one_learn/presentations/widgets/others/simple_network_image.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key, this.isEditAvt = false, this.currentUrl,
  });

  final bool isEditAvt;
  final String? currentUrl;

  @override
  Widget build(BuildContext context) {
    final avaSize = Dimens.getScreenWidth(context) * 0.31;
    return Stack(
      children: [
        ClipOval(
          child: SimpleNetworkImage(
            url: currentUrl,
            width: avaSize,
            height: avaSize,
          ),
        ),
        Visibility(
          visible: isEditAvt,
          child: Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {},
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
