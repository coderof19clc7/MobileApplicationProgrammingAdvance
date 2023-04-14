import 'package:flutter/material.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({super.key, this.isEditAvt = false});

  final bool isEditAvt;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipOval(
          child: Image.network(
            'https://s3-alpha-sig.figma.com/img/3370/0844/0c1e8c242531a517a45da5be3c4cd1df?Expires=1679270400&Signature=i1BEIEABFWK6ZmEfTe5XvYCPNnBSrmxPTJVu4y8m0e5KNihKdcxzJ2vx5z7p9BX4dDazc0XUM53kSP6oAtWgGcFC8d3h7GFPNTKP6u7TnRoUFlS-Sl8oGahXd6cX8nvRWc19IFDiYJyrqRqHQ~k7oDZSccAvSGX91pc-xKfxT9fY38zR7Kw0hhkxZboXiq4EK1-MSNrEfAozJb0-7JGAoHEGvqRKafHMkkHQE5ijPK2lVNm9sczGUA5Gb~MMfjsqQZLIk-i-QqCaW-aGBlUd3JIXHWe3EzMVJqavO~JokZ7xqZ7JS2bSB9epYe6O0aihvgjVVz5geO5~bcl5ug4--w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
            width: Dimens.getScreenWidth(context) * 0.348717,
            height: Dimens.getScreenWidth(context) * 0.348717,
            fit: BoxFit.cover,
          ),
        ),
        Visibility(
          visible: isEditAvt,
          child: Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: Dimens.getProportionalScreenWidth(context, 30),
              height: Dimens.getProportionalScreenWidth(context, 30),
              decoration: BoxDecoration(
                color: context.theme.colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.camera_alt_rounded,
                color: context.theme.colorScheme.onPrimary,
                size: Dimens.getProportionalScreenWidth(context, 19),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
