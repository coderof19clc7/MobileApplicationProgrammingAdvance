import 'package:flutter/material.dart';

class SimpleNetworkImage extends StatelessWidget {
  const SimpleNetworkImage({
    super.key,
    this.url,
    this.fit = BoxFit.cover,
    this.loadingBuilder,
    this.errorBuilder,
  });

  final String? url;
  final BoxFit fit;
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
        return const Icon(Icons.error);
      },
    );
  }
}
