import 'package:avo/presentation/theme/app_color.dart';
import 'package:avo/presentation/utils/asset_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CashedImages extends StatelessWidget {
  const CashedImages({
    super.key,
    required this.imageUrl,
    this.localImage,
    this.width,
    this.height,
    this.fit,
    this.imageRadius,
    this.borderRadius,
    this.isSvg = false,
  });
  final String imageUrl;
  final String? localImage;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final double? imageRadius;
  final BorderRadiusGeometry? borderRadius;
  final bool isSvg;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(imageRadius ?? 0),
      child: imageUrl.isNotEmpty
          ? CachedNetworkImage(
              fit: fit ?? BoxFit.cover,
              errorListener: (value) {},
              imageUrl: imageUrl,
              height: height,
              alignment: Alignment.center,
              width: width,
              placeholder: (context, url) => SizedBox(
                width: width,
                height: height,
                child: Center(
                  child: LoadingAnimationWidget.flickr(
                    size: 40,
                    leftDotColor: AppColor.secondary,
                    rightDotColor: AppColor.primary,
                  ),
                ),
              ),

              filterQuality: FilterQuality.low,
              fadeOutDuration: const Duration(milliseconds: 300),
              fadeInDuration: const Duration(milliseconds: 300),
              errorWidget: (context, url, error) => isSvg
                  ? SvgPicture.asset(
                      AssetUtil.logoSvg,
                      width: width,
                      height: height,
                      fit: fit ?? BoxFit.contain,
                      alignment: Alignment.center,
                      colorFilter: ColorFilter.mode(
                        theme.iconTheme.color!,
                        BlendMode.srcIn,
                      ),
                    )
                  : Image.asset(
                      localImage ?? AssetUtil.logoPng,
                      width: width,
                      alignment: Alignment.center,
                      height: height,
                      fit: fit ?? BoxFit.contain,
                    ),
            )
          : isSvg
          ? SvgPicture.asset(
              AssetUtil.logoSvg,
              width: width,
              height: height,
              alignment: Alignment.center,
              fit: fit ?? BoxFit.contain,
              colorFilter: ColorFilter.mode(
                theme.iconTheme.color!,
                BlendMode.srcIn,
              ),
            )
          : Image.asset(
              localImage ?? AssetUtil.logoSvg,
              width: width,
              height: height,
              fit: fit ?? BoxFit.contain,
              alignment: Alignment.center,
            ),
    );
  }
}

class CustomSvgImage extends StatelessWidget {
  const CustomSvgImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      imageUrl,
      placeholderBuilder: (context) => LoadingAnimationWidget.flickr(
        size: 20,
        leftDotColor: AppColor.secondary,
        rightDotColor: AppColor.primary,
      ),
      errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
    );
  }
}
