import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:evo_med/features/common/presentation/widgets/image_preloader.dart';

class CustomImageView extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final BorderRadius? borderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;
  final Color borderColor;
  final double borderWidth;

  const CustomImageView({
    this.imageUrl = "",
    this.width,
    this.height,
    this.fit = BoxFit.fill,
    this.color,
    this.borderRadius,
    super.key,
    this.placeholder,
    this.errorWidget,
    this.borderColor=Colors.transparent,
    this.borderWidth=0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: borderWidth),
        borderRadius: borderRadius ?? BorderRadius.circular(0),
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(0),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: width,
          height: height,
          color: color,
          fit: fit,
          placeholder: (context, url) =>
              placeholder ?? const ImagePreloadShimmer(),
          errorWidget: (context, url, error) =>
              errorWidget ??
               const Icon(Icons.error_outline_rounded),
        ),
      ),
    );
  }
}  
      