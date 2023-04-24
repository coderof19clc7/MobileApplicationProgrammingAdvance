import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';

class SimpleNetworkImage extends StatelessWidget {
  const SimpleNetworkImage({
    super.key,
    this.url,
    this.fit = BoxFit.cover,
    this.errorIconSize,
    this.loadingBuilder,
    this.errorBuilder,
  });

  final String? url;
  final BoxFit fit;
  final double? errorIconSize;
  final Widget Function(BuildContext, Widget, ImageChunkEvent?)? loadingBuilder;
  final Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url ?? '',
      fit: fit,
      loadingBuilder: loadingBuilder ?? (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      errorBuilder: errorBuilder ?? (context, error, stackTrace) {
        return DecoratedBox(
          decoration: BoxDecoration(
              color: AppColors.grey
          ),
          child: Icon(
            Icons.error,
            size: errorIconSize,
          ),
        );
      },
    );
  }
}
